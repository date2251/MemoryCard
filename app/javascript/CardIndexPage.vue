<template>
	<div id="app">
		<table>
			<tbody>
				<tr v-for="i in 52">
					<div class="card">{{cards[i]}}</div>
				</tr>
			</tbody>
		</table>
	</div>
</template>

<script>

export default {
  data: function () {
		return {
			cards: [
				{num: 1, mark: 'heart'},
				{num: 2, mark: 'heart'},
				{num: 3, mark: 'heart'},
				{num: 4, mark: 'heart'},
				{num: 5, mark: 'heart'},
				{num: 6, mark: 'heart'},
				{num: 7, mark: 'heart'},
				{num: 8, mark: 'heart'},
				{num: 9, mark: 'heart'},
				{num: 10, mark: 'heart'},
				{num: 11, mark: 'heart'},
				{num: 12, mark: 'heart'},
				{num: 13, mark: 'heart'},
				{num: 1, mark: 'dia'},
				{num: 2, mark: 'dia'},
				{num: 3, mark: 'dia'},
				{num: 4, mark: 'dia'},
				{num: 5, mark: 'dia'},
				{num: 6, mark: 'dia'},
				{num: 7, mark: 'dia'},
				{num: 8, mark: 'dia'},
				{num: 9, mark: 'dia'},
				{num: 10, mark: 'dia'},
				{num: 11, mark: 'dia'},
				{num: 12, mark: 'dia'},
				{num: 13, mark: 'dia'},
				{num: 1, mark: 'spade'},
				{num: 2, mark: 'spade'},
				{num: 3, mark: 'spade'},
				{num: 4, mark: 'spade'},
				{num: 5, mark: 'spade'},
				{num: 6, mark: 'spade'},
				{num: 7, mark: 'spade'},
				{num: 8, mark: 'spade'},
				{num: 9, mark: 'spade'},
				{num: 10, mark: 'spade'},
				{num: 11, mark: 'spade'},
				{num: 12, mark: 'spade'},
				{num: 13, mark: 'spade'},
				{num: 1, mark: 'club'},
				{num: 2, mark: 'club'},
				{num: 3, mark: 'club'},
				{num: 4, mark: 'club'},
				{num: 5, mark: 'club'},
				{num: 6, mark: 'club'},
				{num: 7, mark: 'club'},
				{num: 8, mark: 'club'},
				{num: 9, mark: 'club'},
				{num: 10, mark: 'club'},
				{num: 11, mark: 'club'},
				{num: 12, mark: 'club'},
				{num: 13, mark: 'club'}
			]
		}
  },
	created () {
		// 順番をランダム化 //
		for (var i=this.cards.length; i>0; i--) {
			var rnd = Math.floor(Math.random() * i);
			var tmp = this.cards[i-1];
			this.cards[i] = this.cards[rnd];
			this.cards[rnd] = tmp;
		}
	}
}

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

.card {
	border: 1px solid;
}
</style>
