package com.lightningkite.kwift.observables.actual

import android.support.v4.widget.SwipeRefreshLayout
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.View
import android.view.ViewGroup
import com.lightningkite.kwift.observables.shared.ObservableProperty
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.observables.shared.addAndRunWeak


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

fun <T> RecyclerView.bind(
    data: ObservableProperty<List<T>>,
    defaultValue: T,
    makeView: (ObservableProperty<T>) -> View
) {
    layoutManager = LinearLayoutManager(context)
    adapter = object : RecyclerView.Adapter<RecyclerView.ViewHolder>() {
        init {
            println("Setting up adapter")
            data.addAndRunWeak(this) { self, _ ->
                self.notifyDataSetChanged()
            }
        }

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
            println("Creating view holder")
            val event = StandardObservableProperty<T>(defaultValue)
            val subview = makeView(event)
            subview.tag = event
            return object : RecyclerView.ViewHolder(subview) {}
        }

        override fun getItemCount(): Int = data.value.size

        @Suppress("UNCHECKED_CAST")
        override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
            (holder.itemView.tag as? StandardObservableProperty<T>)?.let {
                println("Updating value to ${data.value[position]}")
                it.value = data.value[position]
            } ?: run {
                println("Failed to find property to update")
            }
        }
    }

}

fun RecyclerView.bindRefresh(
    loading: ObservableProperty<Boolean>,
    refresh: () -> Unit
) {
    (this.parent as? SwipeRefreshLayout)?.run {
        loading.addAndRunWeak(this) { self, value ->
            self.post {
                self.isRefreshing = value
            }
        }
        setOnRefreshListener {
            refresh()
        }
    }
}

