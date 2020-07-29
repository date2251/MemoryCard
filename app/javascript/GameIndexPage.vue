<template>
	<div>
		<navbar></navbar>
		<div style="display: flex; justify-content: space-between">
			<div v-if="gameStart" class="gameareawrap"><component :is="gameStart"></component></div>
			<div v-else class="startbtnwrap" ><button @click='ViewGameArea' class="startbtn">ゲーム開始</button></div>
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
	},
	data () {
		return {
			gameStart: ''
		}
	},
	methods: {
		ViewGameArea(){
			this.gameStart = "gamearea"
		}
	}
}
</script>

<style scoped>
.gameareawrap {
	width: 80%;
	height: 570px;
	padding: 10px;
	background-color: green;
}

.startbtnwrap {
	width: 80%;
	height: 570px;
	text-align: center;
	background-color: green;
}

.startbtn {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
}
</style>
