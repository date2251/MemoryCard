<template>
  <div>
    <nav-bar/>
    <div class="content">
      <div v-if="isShowGameArea" class="gameAreaWrap">
        <game-area/>
      </div>
      <div v-else class="startBtnWrap" >
        <button @click='showGameArea' class="startBtn">開始</button>
      </div>
      <side-bar/>
    </div>
    <footer-area/>
  </div>
</template>

<script>
import navBar from './NavBar.vue'
import sideBar from './SideBar.vue'
import gameArea from './GameArea.vue'
import footerArea from './FooterArea.vue'

export default {
  components: {
    gameArea,
    sideBar,
    navBar,
    footerArea
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

.gameAreaWrap {
  width: 80%;
  min-height: 570px;
  padding: 10px;
  background-color: green;
}

.startBtnWrap {
  width: 80%;
  height: 590px;
  padding: 10px;
  text-align: center;
  background-color: green;
}

.startBtn {
  width: 200px;
  height: 50px;
  font-size: 2em;
  align-items: center;
  font-size: 2em;
  margin-top: 250px;
}
</style>
