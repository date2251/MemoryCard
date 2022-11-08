<template>
  <div>
    <navbar></navbar>
    <div class="content">
      <div v-if="isShowGameArea" class="gameareawrap">
        <gamearea/>
      </div>
      <div v-else class="startbtnwrap" >
        <button @click='showGameArea' class="startbtn">開始</button>
      </div>
      <sidebar/>
    </div>
    <footerarea/>
  </div>
</template>

<script>
import navbar from './NavBar.vue'
import sidebar from './SideBar.vue'
import gamearea from './GameArea.vue'
import footerarea from './FooterArea.vue'

export default {
  components: {
    gamearea,
    sidebar,
    navbar,
    footerarea
  },
  data () {
    return {
      isShowGameArea: false
    }
  },
  methods: {
    showGameArea(){
      this.isShowGameArea = true
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
  min-height: 570px;
  padding: 10px;
  background-color: green;
}

.startbtnwrap {
  width: 80%;
  height: 590px;
  padding: 10px;
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
