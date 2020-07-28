<template>
	<div>
	<navbar></navbar>
	<gamearea></gamearea>
	</div>
</template>

<script>
import navbar from './NavBar.vue'
import gamearea from './GameArea.vue'

export default {
	components: {
		gamearea,
		navbar
	}
}
</script>

<style scoped>
</style>
