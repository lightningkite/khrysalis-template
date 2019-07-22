package com.lightningkite.kwift.android

import android.support.annotation.ColorRes
import android.support.annotation.IdRes
import android.support.v4.widget.SwipeRefreshLayout
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import br.com.simplepass.loading_button_lib.customViews.CircularProgressButton
import com.lightningkite.kwift.actuals.DateButton
import com.lightningkite.kwift.actuals.ImageData
import com.lightningkite.kwift.actuals.StringReference
import com.lightningkite.kwift.shared.ObservableProperty
import com.lightningkite.kwift.shared.ViewDataStack
import com.squareup.picasso.Picasso
import com.lightningkite.kwifttemplate.R
import java.util.*


fun EditText.bindString(observable: ObservableProperty<String>) {
    lifecycle.bind(observable) {
        if (observable.value != text.toString()) {
            this.setText(observable.value)
        }
    }
    addTextChangedListener(object : TextWatcher {
        override fun afterTextChanged(s: Editable?) {}
        override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
        override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
            if (observable.value != s) {
                observable.value = (s.toString())
            }
        }
    })
}

fun TextView.bindString(observable: ObservableProperty<String>) {
    lifecycle.bind(observable) {
        this.text = observable.value
    }
}

fun TextView.bindStringRes(observable: ObservableProperty<StringReference?>) {
    lifecycle.bind(observable) {
        visibility = if (it == null) View.GONE else View.VISIBLE
        if (it != null) {
            text = resources.getString(it)
        }
    }
}

fun <T> TextView.bindText(obs: ObservableProperty<T>, transform: (T) -> String) {
    lifecycle.bind(obs) {
        text = transform(it)
    }
}

fun EditText.bindInteger(obs: ObservableProperty<Int>) {
    lifecycle.bind(obs) {
        val currentValue = text.toString().toIntOrNull()
        if (currentValue != null && obs.value != currentValue) {
            this.setText(obs.value.takeUnless { it == 0 }?.toString() ?: "")
        }
    }
    addTextChangedListener(object : TextWatcher {
        override fun afterTextChanged(s: Editable?) {}
        override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
        override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
            val currentValue = s.toString().toIntOrNull()
            if (currentValue != null && obs.value != currentValue) {
                obs.value = currentValue
            }
        }
    })
}

fun EditText.bindDouble(obs: ObservableProperty<Double>) {
    lifecycle.listen(obs.onChange) {
        val currentValue = text.toString().toDoubleOrNull()
        if (currentValue != null && obs.value != currentValue) {
            this.setText(obs.value.takeUnless { it == 0.0 }?.toString() ?: "")
        }
    }
    addTextChangedListener(object : TextWatcher {
        override fun afterTextChanged(s: Editable?) {}
        override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
        override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
            val currentValue = s.toString().toDoubleOrNull()
            if (currentValue != null && obs.value != currentValue) {
                obs.value = currentValue
            }
        }
    })
}

fun <T> CompoundButton.bindSelect(value: T, obs: ObservableProperty<T>) {
    lifecycle.bind(obs) {
        this.isChecked = it == value
    }
    setOnCheckedChangeListener { buttonView, isChecked ->
        if (isChecked) {
            obs.value = value
        } else {
            this.isChecked = obs.value == value
        }
    }

}

fun CompoundButton.bind(obs: ObservableProperty<Boolean>) {
    lifecycle.bind(obs) {
        if (it != this.isChecked) {
            this.isChecked = it
        }
    }
    setOnCheckedChangeListener { buttonView, isChecked ->
        if (obs.value != isChecked) {
            obs.value = isChecked
        }
    }
}

fun FrameLayout.bindStack(obs: ViewDataStack) {
    var currentData = obs.stack.lastOrNull()
    var currentStackSize = obs.stack.size
    var currentView = currentData?.view(context) ?: View(context)
    addView(
        currentView, FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT
        )
    )
    lifecycle.listen(obs.changeEvent) { datas ->
        post {
            if (currentData == datas.lastOrNull()) return@post

            val oldView = currentView
            val oldStackSize = currentStackSize

            val newView = obs.stack.lastOrNull()?.view(context) ?: View(context)
            addView(
                newView, FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
                )
            )
            val newStackSize = datas.size

            if (oldStackSize > newStackSize) {
                oldView.animate().translationX(width.toFloat())
                newView.translationX = -width.toFloat()
                newView.animate().translationX(0f)
            } else if (oldStackSize < newStackSize) {
                oldView.animate().translationX(-width.toFloat())
                newView.translationX = width.toFloat()
                newView.animate().translationX(0f)
            } else {
                oldView.animate().alpha(0f)
                newView.alpha = 0f
                newView.animate().alpha(1f)
            }
            oldView.animate().withEndAction { removeView(oldView) }

            currentData = datas.lastOrNull()
            currentView = newView
            currentStackSize = newStackSize
        }
    }

}

fun View.bindBackButton(obs: ViewDataStack) {
    visibility = if (obs.stack.size >= 2) View.VISIBLE else View.INVISIBLE
    lifecycle.listen(obs.changeEvent) { datas ->
        visibility = if (datas.size >= 2) View.VISIBLE else View.INVISIBLE
    }
    setOnClickListener {
        obs.pop()
    }
}

fun RecyclerView.whenScrolledToEnd(action: () -> Unit) {
    addOnScrollListener(object : RecyclerView.OnScrollListener() {
        override fun onScrolled(recyclerView: RecyclerView, dx: Int, dy: Int) {
            (layoutManager as? LinearLayoutManager)?.let {
                if (it.findLastVisibleItemPosition() == adapter?.itemCount?.minus(1)) {
                    action()
                }
            }
        }
    })
}

fun <T> RecyclerView.bind(data: List<T>, layout: Int, setup: View.(item: T) -> Unit) {
    layoutManager = LinearLayoutManager(context)
    adapter = object : RecyclerView.Adapter<RecyclerView.ViewHolder>() {
        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
            val subview = LayoutInflater.from(context).inflate(layout, parent, false)
            return object : RecyclerView.ViewHolder(subview) {}
        }

        override fun getItemCount(): Int = data.size

        override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
            setup.invoke(holder.itemView, data[position])
        }
    }

}

fun <T> RecyclerView.bind(
    data: ObservableProperty<List<T>>,
    layout: Int,
    setup: View.(item: T) -> Unit
) {
    layoutManager = LinearLayoutManager(context)
    adapter = object : RecyclerView.Adapter<RecyclerView.ViewHolder>() {
        init {
            lifecycle.bind(data) {
                notifyDataSetChanged()
            }
        }

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
            val subview = LayoutInflater.from(context).inflate(layout, parent, false)
            return object : RecyclerView.ViewHolder(subview) {}
        }

        override fun getItemCount(): Int = data.value.size

        override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
            setup.invoke(holder.itemView, data.value[position])
        }
    }

}

fun <T> Spinner.bind(
    options: ObservableProperty<List<T>>,
    selected: ObservableProperty<T>,
    layout: Int,
    setup: View.(item: T) -> Unit
) {
    adapter = object : BaseAdapter() {
        init {
            lifecycle.listen(options.onChange) {
                notifyDataSetChanged()
            }
        }

        override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {
            val view = convertView ?: LayoutInflater.from(context).inflate(layout, parent, false)
            return view.apply {
                setup.invoke(this, options.value[position])
            }
        }

        override fun getItem(position: Int): Any? = options.value.getOrNull(position)
        override fun getItemId(position: Int): Long = position.toLong()
        override fun getCount(): Int = options.value.size
    }
    lifecycle.bind(selected) {
        val index = options.value.indexOf(it)
        if (index != -1 && index != selectedItemPosition) {
            setSelection(index)
        }
    }
    onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
        override fun onNothingSelected(parent: AdapterView<*>?) {}

        override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
            val index = options.value.indexOf(selected.value)
            if (index != -1 && index != position) {
                selected.value = options.value[position]
            }
        }
    }

}


fun <T> Spinner.bind(
    options: List<T>,
    selected: ObservableProperty<T>,
    layout: Int,
    setup: View.(item: T) -> Unit
) {
    adapter = object : BaseAdapter() {
        override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {
            val view = convertView ?: LayoutInflater.from(context).inflate(layout, parent, false)
            return view.apply {
                setup.invoke(this, options[position])
            }
        }

        override fun getItem(position: Int): Any? = options.getOrNull(position)
        override fun getItemId(position: Int): Long = position.toLong()
        override fun getCount(): Int = options.size
    }
    lifecycle.bind(selected) {
        val index = options.indexOf(it)
        if (index != -1 && index != selectedItemPosition) {
            setSelection(index)
        }
    }
    onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
        override fun onNothingSelected(parent: AdapterView<*>?) {}

        override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
            val index = options.indexOf(selected.value)
            if (index != -1 && index != position) {
                selected.value = options[position]
            }
        }
    }
}


fun SwipeRefreshLayout.bind(
    loading: ObservableProperty<Boolean>,
    refresh: () -> Unit
) {
    lifecycle.bind(loading) {
        post {
            this.isRefreshing = loading.value
        }
    }
    setOnRefreshListener {
        refresh()
    }
}


fun ImageView.loadUrl(imageUrl: String?) {
    if (imageUrl != null && imageUrl.isNotBlank()) {
        Picasso.get()
            .load(imageUrl)
            .resize(width.coerceAtLeast(100), height.coerceAtLeast(100))
            .centerCrop()
            .into(this)
    }
}

fun ImageView.loadUrl(imageUrl: ObservableProperty<String?>) {
    lifecycle.bind(imageUrl) {
        if (it != null && it.isNotBlank()) {
            Picasso.get()
                .load(it)
                .resize(width.coerceAtLeast(100), height.coerceAtLeast(100))
                .centerCrop()
                .into(this)
        }
    }
}

fun ImageView.loadUrlNotNull(imageUrl: ObservableProperty<String>) {
    lifecycle.bind(imageUrl) {
        if (it.isNotBlank()) {
            Picasso.get()
                .load(it)
                .resize(width.coerceAtLeast(100), height.coerceAtLeast(100))
                .centerCrop()
                .into(this)
        }
    }
}

fun DateButton.bind(date: ObservableProperty<Date>) {
    lifecycle.bind(date) {
        this.date = it
    }
    lifecycle.listen(this.onDateEntered) {
        date.value = it
    }
}
