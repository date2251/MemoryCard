<template>
	<div>
		<navbar></navbar>
		<div style="display: flex; justify-content: space-between">
			<gamearea></gamearea>
			<sidebar></sidebar>
		</div>
	</div>
</template>

<script>
import navbar from './NavBar.vue'
import sidebar from './SideBar.vue'
import gamearea from './GameArea.vue'

export default {
	components: {
		gamearea,
		sidebar,
		navbar
	}
}
</script>

<style scoped>
</style>
