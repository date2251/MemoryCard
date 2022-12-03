<template>
  <div>
    <nav-bar/>
    <div class="content">
      <table>
        <tr>
          <th>ユーザー</th><th>試行回数</th>
        </tr>
        <tr v-for="rank in rankings" :key="rank.id">
          <td>{{ rank.userName }}</td><td>{{ rank.tryNum }}</td>
        </tr>
      </table>
      <side-bar/>
    </div>
    <footer-area/>
  </div>
</template>

<script>
import { deserialize } from 'deserialize-json-api'
import navBar from './NavBar.vue'
import sideBar from './SideBar.vue'
import footerArea from './FooterArea.vue'

export default {
  components: {
    sideBar,
    navBar,
    footerArea
  },
  data () {
    return {
      rankings: []
    }
  },
  mounted () {
    this.$axios
      .get('/api/v1/rankings')
      .then(({ data }) => {
        this.rankings = deserialize(data).data
      })
  }
}
</script>

<style scoped>
.content {
  display: flex;
  justify-content: space-between;
  padding: 0 5%;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  text-align: left;
}

table tr{
  border-bottom: solid 1px #eee;
}
</style>
