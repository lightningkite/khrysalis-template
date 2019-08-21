package com.lightningkite.kwift.observables.actual

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.BaseAdapter
import android.widget.Spinner
import com.lightningkite.kwift.observables.shared.MutableObservableProperty
import com.lightningkite.kwift.observables.shared.ObservableProperty
import com.lightningkite.kwift.observables.shared.addAndRunWeak


fun <T, V : View> Spinner.bind(
    options: ObservableProperty<List<T>>,
    selected: MutableObservableProperty<T>,
    makeLayout: () -> V,
    setup: (view: V, item: T) -> Unit
) {
    adapter = object : BaseAdapter() {
        init {
            options.addAndRunWeak(this) { self, _ ->
                self.notifyDataSetChanged()
            }
        }

        @Suppress("UNCHECKED_CAST")
        override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {
            val view = convertView as? V ?: makeLayout()
            return view.apply {
                setup.invoke(this, options.value[position])
            }
        }

        override fun getItem(position: Int): Any? = options.value.getOrNull(position)
        override fun getItemId(position: Int): Long = position.toLong()
        override fun getCount(): Int = options.value.size
    }
    selected.addAndRunWeak(this) { self, it ->
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
    selected: MutableObservableProperty<T>,
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
    selected.addAndRunWeak(this) { self, it ->
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
