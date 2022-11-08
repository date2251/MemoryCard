<template>
  <div>
    <nav-bar/>
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
            <li><a href="https://github.com/date2251?tab=repositories">https://github.com/date2251?tab=repositories</a></li>
          </ul>
      </div>
      <side-bar/>
    </div>
    <footer-area/>
  </div>
</template>

<script>
import navBar from './NavBar.vue'
import sideBar from './SideBar.vue'
import footerArea from './FooterArea.vue'

export default {
  components: {
    sideBar,
    navBar,
    footerArea
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
