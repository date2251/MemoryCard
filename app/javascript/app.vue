<template>
	<div>
		<router-view></router-view>
	</div>
</template>

<script>
import Vue from 'vue';
import VueRouter from 'vue-router'

import CardIndexPage from 'CardIndexPage.vue'

const router = new VueRouter({
	routes: [
		{ path: '/',
			component: CardIndexPage }
	]
})

Vue.use(VueRouter)

export default {
	router
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
