<template>
	<div id="app">
		<table>
			<tr>
				<td v-for="i in 13"><div class="card" v-on:click="isClick(i)" v-bind:class="{opened:cards[i].isopened}">{{cards[i]}}</div></td>
			</tr>
			<tr>
				<td v-for="i in 13"><div class="card" v-on:click='isClick(i+13)' v-bind:class='{opened:cards[i+13].isopened}'>{{cards[i + 13]}}</div></td>
			</tr>
			<tr>
				<td v-for="i in 13"><div class="card" v-on:click='isClick(i+26)' v-bind:class='{opened:cards[i+26].isopened}'>{{cards[i+ 26]}}</div></td>
			</tr>
			<tr>
				<td v-for="i in 13"><div class="card" v-on:click='isClick(i+39)' v-bind:class='{opened:cards[i+39].isopened}'>{{cards[i+ 39]}}</div></td>
			</tr>
		</table>
	</div>
</template>

<script>

export default {
  data: function () {
		return {
			cards: [
				{id: 1, num: 1, mark: 'heart', isopened: false},
				{id: 2, num: 2, mark: 'heart', isopened: false},
				{id: 3, num: 3, mark: 'heart', isopened: false},
				{id: 4, num: 4, mark: 'heart', isopened: false},
				{id: 5, num: 5, mark: 'heart', isopened: false},
				{id: 6, num: 6, mark: 'heart', isopened: false},
				{id: 7, num: 7, mark: 'heart', isopened: false},
				{id: 8, num: 8, mark: 'heart', isopened: false},
				{id: 9, num: 9, mark: 'heart', isopened: false},
				{id: 10, num: 10, mark: 'heart', isopened: false},
				{id: 11, num: 11, mark: 'heart', isopened: false},
				{id: 12, num: 12, mark: 'heart', isopened: false},
				{id: 13, num: 13, mark: 'heart', isopened: false},
				{id: 14, num: 1, mark: 'dia', isopened: false},
				{id: 15, num: 2, mark: 'dia', isopened: false},
				{id: 16, num: 3, mark: 'dia', isopened: false},
				{id: 17, num: 4, mark: 'dia', isopened: false},
				{id: 18, num: 5, mark: 'dia', isopened: false},
				{id: 19, num: 6, mark: 'dia', isopened: false},
				{id: 20, num: 7, mark: 'dia', isopened: false},
				{id: 21, num: 8, mark: 'dia', isopened: false},
				{id: 22, num: 9, mark: 'dia', isopened: false},
				{id: 23, num: 10, mark: 'dia', isopened: false},
				{id: 24, num: 11, mark: 'dia', isopened: false},
				{id: 25, num: 12, mark: 'dia', isopened: false},
				{id: 26, num: 13, mark: 'dia', isopened: false},
				{id: 27, num: 1, mark: 'spade', isopened: false},
				{id: 28, num: 2, mark: 'spade', isopened: false},
				{id: 29, num: 3, mark: 'spade', isopened: false},
				{id: 30, num: 4, mark: 'spade', isopened: false},
				{id: 31, num: 5, mark: 'spade', isopened: false},
				{id: 32, num: 6, mark: 'spade', isopened: false},
				{id: 33, num: 7, mark: 'spade', isopened: false},
				{id: 34, num: 8, mark: 'spade', isopened: false},
				{id: 35, num: 9, mark: 'spade', isopened: false},
				{id: 36, num: 10, mark: 'spade', isopened: false},
				{id: 37, num: 11, mark: 'spade', isopened: false},
				{id: 38, num: 12, mark: 'spade', isopened: false},
				{id: 39, num: 13, mark: 'spade', isopened: false},
				{id: 40, num: 1, mark: 'club', isopened: false},
				{id: 41, num: 2, mark: 'club', isopened: false},
				{id: 42, num: 3, mark: 'club', isopened: false},
				{id: 43, num: 4, mark: 'club', isopened: false},
				{id: 44, num: 5, mark: 'club', isopened: false},
				{id: 45, num: 6, mark: 'club', isopened: false},
				{id: 46, num: 7, mark: 'club', isopened: false},
				{id: 47, num: 8, mark: 'club', isopened: false},
				{id: 48, num: 9, mark: 'club', isopened: false},
				{id: 49, num: 10, mark: 'club', isopened: false},
				{id: 50, num: 11, mark: 'club', isopened: false},
				{id: 51, num: 12, mark: 'club', isopened: false},
				{id: 52, num: 13, mark: 'club', isopened: false}
			],
			count: [
				{clicknum: 0}
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
	},
	methods: {
		isClick: function (id) {
			// 3秒後に全て裏にする関数 //
			var reset = function (cards, cnt) {
				for (var i = cards.length; i > 0; i--) {
					cards[i-1].isopened = false;
				}
				cnt[0].clicknum = 0;
			}
			// 2枚以上はめくれない //
			if (this.count[0].clicknum < 2) {
				this.cards[id].isopened = !this.cards[id].isopened;
				this.count[0].clicknum += 1;
				if (this.count[0].clicknum > 1 ) {
					setTimeout(reset, 3000, this.cards, this.count);
				}
			}
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

.opened {
	border: 1px solid red;
}
</style>
