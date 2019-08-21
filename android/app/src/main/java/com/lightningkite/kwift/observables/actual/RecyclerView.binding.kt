package com.lightningkite.kwift.observables.actual

import android.support.v4.widget.SwipeRefreshLayout
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.View
import android.view.ViewGroup
import com.lightningkite.kwift.observables.shared.ObservableProperty
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

fun <T, V : View> RecyclerView.bind(
    data: ObservableProperty<List<T>>,
    makeLayout: () -> V,
    setup: (view: V, item: T) -> Unit
) {
    layoutManager = LinearLayoutManager(context)
    adapter = object : RecyclerView.Adapter<RecyclerView.ViewHolder>() {
        init {
            data.addAndRunWeak(this) { self, _ ->
                self.notifyDataSetChanged()
            }
        }

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
            val subview = makeLayout()
            return object : RecyclerView.ViewHolder(subview) {}
        }

        override fun getItemCount(): Int = data.value.size

        override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
            setup.invoke(holder.itemView as V, data.value[position])
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

