<template>
  <div>
    <navbar></navbar>
    <div class="content">
      <table>
        <tr>
          <th>ユーザー</th><th>試行回数</th>
        </tr>
        <tr v-for="rank in rankings" :key="rank.id">
          <td>{{ rank.username }}</td><td>{{ rank.trynum }}</td>
        </tr>
      </table>
      <sidebar></sidebar>
    </div>
    <footerarea></footerarea>
  </div>
</template>

<script>
import navbar from './NavBar.vue'
import sidebar from './SideBar.vue'
import footerarea from './FooterArea.vue'

export default {
  components: {
    sidebar,
    navbar,
    footerarea
  },
  data () {
    return {
      rankings: []
    }
  },
  mounted () {
    this.$axios
      .get('/api/v1/rankings')
      .then(response => (this.rankings = response.data))
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
