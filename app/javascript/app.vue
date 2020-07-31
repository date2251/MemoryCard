<template>
	<div>
		<router-view></router-view>
	</div>
</template>

<script>
import Vue from 'vue';
import VueRouter from 'vue-router'

import GameIndexPage from 'GameIndexPage.vue'
import RankingPage from 'RankingPage.vue'
import FrameworkPage from 'FrameworkPage.vue'

const router = new VueRouter({
	routes: [
		{ path: '/',
			name: 'Home',
			component: GameIndexPage },
		{ path: '/ranking',
			name: 'RankingPage',
			component: RankingPage },
		{ path: '/framework',
			name: 'FrameworkPage',
			component: FrameworkPage }
	]
})

Vue.use(VueRouter)

export default {
	router
}
</script>

<style>
p {
  font-size: 2em;
  text-align: center;
}

body {
	width: 100%;
	margin: 0;
}
</style>
