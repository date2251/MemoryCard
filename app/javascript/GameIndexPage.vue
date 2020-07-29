<template>
	<div>
		<navbar></navbar>
		<div class="content">
			<div v-if="gameStart" class="gameareawrap"><component :is="gameStart"></component></div>
			<div v-else class="startbtnwrap" ><button @click='ViewGameArea' class="startbtn">ゲーム開始</button></div>
			<sidebar></sidebar>
		</div>
		<footerarea></footerarea>
	</div>
</template>

<script>
import navbar from './NavBar.vue'
import sidebar from './SideBar.vue'
import gamearea from './GameArea.vue'
import footerarea from './Footer.vue'

export default {
	components: {
		gamearea,
		sidebar,
		navbar,
		footerarea
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
.content {
	display: flex;
	justify-content: space-between;
	padding: 0 5%;
}

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
	width: 200px;
	height: 50px;
	font-size: 2em;
	align-items: center;
	font-size: 2em;
	margin-top: 250px;
}
</style>
