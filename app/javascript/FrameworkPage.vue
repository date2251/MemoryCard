<template>
	<div>
		<navbar></navbar>
		<div class="content">
			<div class="framework-wrapper">
				<h2>プラットフォーム</h2>
				<ul>
					<li>AWS</li>
					<li>Docker</li>
				</ul>
				<h2>フレームワーク</h2>
					<ul>
						<li>RubyOnRails</li>
						<li>Vue.js</li>
					</ul>
				<h2>リンク</h2>
					<ul>
						<li>GitHub</li>
						<li><a href="https://github.com/bigmonstershift?tab=repositories">https://github.com/bigmonstershift?tab=repositories</a></li>
					</ul>
			</div>
			<sidebar></sidebar>
		</div>
		<footerarea></footerarea>
	</div>
</template>

<script>
import navbar from './NavBar.vue'
import sidebar from './SideBar.vue'
import footerarea from './Footer.vue'

export default {
	components: {
		sidebar,
		navbar,
		footerarea
	}
}
</script>

<style scoped>
h2 {
	border-bottom: solid 1px gray;
}

.content {
	display: flex;
	justify-content: space-between;
	padding: 0 5%;
}
</style>
