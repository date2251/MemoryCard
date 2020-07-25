<template>
	<div id="app">
		<table>
			<tbody>
				<tr>
					<th>ID</th>
					<th>数字</th>
					<th>マーク</th>
				</tr>
				<tr v-for="c in cards" :key="c.id">
					<td>{{ c.id }}</td>
					<td>{{ c.num }}</td>
					<td>{{ c.mark }}</td>
				</tr>
			</tbody>
		</table>
	</div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
			cards: []
    }
  },
	mounted () {
		axios
			.get('/api/v1/cards.json')
			.then(response => (this.cards = response.data))
	}
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
