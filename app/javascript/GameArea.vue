<template>
	<div id="app">
		<table>
			<tr>
				<td v-for="i in 9">
					<div class="card" v-on:click='isClick(i)' v-bind:class='{opened:cards[i-1].isopened, hitted:cards[i-1].ishit}'>{{cards[i-1]}}</div>
				</td>
			</tr>
			<tr>
				<td v-for="i in 9">
					<div class="card" v-on:click='isClick(i+9)' v-bind:class='{opened:cards[i+8].isopened, hitted:cards[i+8].ishit}'>{{cards[i+8]}}</div>
				</td>
			</tr>
			<tr>
				<td v-for="i in 8">
					<div class="card" v-on:click='isClick(i+18)' v-bind:class='{opened:cards[i+17].isopened, hitted:cards[i+17].ishit}'>{{cards[i+17]}}</div>
				</td>
			</tr>
		</table>
		<div style="float: right">試行回数{{count[0].turnnum}}</div>
	</div>
</template>

<script>

export default {
  data: function () {
		return {
			cards: [
				{id: 1, num: 1, mark: 'spade', isopened: false, ishit: false},
				{id: 2, num: 2, mark: 'spade', isopened: false, ishit: false},
				{id: 3, num: 3, mark: 'spade', isopened: false, ishit: false},
				{id: 4, num: 4, mark: 'spade', isopened: false, ishit: false},
				{id: 5, num: 5, mark: 'spade', isopened: false, ishit: false},
				{id: 6, num: 6, mark: 'spade', isopened: false, ishit: false},
				{id: 7, num: 7, mark: 'spade', isopened: false, ishit: false},
				{id: 8, num: 8, mark: 'spade', isopened: false, ishit: false},
				{id: 9, num: 9, mark: 'spade', isopened: false, ishit: false},
				{id: 10, num: 10, mark: 'spade', isopened: false, ishit: false},
				{id: 11, num: 11, mark: 'spade', isopened: false, ishit: false},
				{id: 12, num: 12, mark: 'spade', isopened: false, ishit: false},
				{id: 13, num: 13, mark: 'spade', isopened: false, ishit: false},
				{id: 14, num: 1, mark: 'club', isopened: false, ishit: false},
				{id: 15, num: 2, mark: 'club', isopened: false, ishit: false},
				{id: 16, num: 3, mark: 'club', isopened: false, ishit: false},
				{id: 17, num: 4, mark: 'club', isopened: false, ishit: false},
				{id: 18, num: 5, mark: 'club', isopened: false, ishit: false},
				{id: 19, num: 6, mark: 'club', isopened: false, ishit: false},
				{id: 20, num: 7, mark: 'club', isopened: false, ishit: false},
				{id: 21, num: 8, mark: 'club', isopened: false, ishit: false},
				{id: 22, num: 9, mark: 'club', isopened: false, ishit: false},
				{id: 23, num: 10, mark: 'club', isopened: false, ishit: false},
				{id: 24, num: 11, mark: 'club', isopened: false, ishit: false},
				{id: 25, num: 12, mark: 'club', isopened: false, ishit: false},
				{id: 26, num: 13, mark: 'club', isopened: false, ishit: false}
			],
			count: [
				{clicknum: 0, beforeid: 0, afterid: 0, turnnum: 0}
			]
		}
  },
	created () {
		// 順番をランダム化 //
		for (var i=this.cards.length; i>0; i--) {
			var rnd = Math.floor(Math.random() * (this.cards.length - 1));
			var tmp = this.cards[i-1];
			this.cards[i-1] = this.cards[rnd];
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
			// 1秒後にヒットにする関数 //
			var hitset = function (cards, cnt) {
				cards[cnt[0].beforeid - 1].ishit = true;
				cards[cnt[0].afterid - 1].ishit = true;
				cnt[0].clicknum = 0;
			}
				
			// 2枚以上はめくれない //
			if (this.count[0].clicknum < 2) {
				if (this.count[0].clicknum == 0) {
					// 1枚目 //
					this.cards[id-1].isopened = true;
					this.count[0].clicknum += 1;
					this.count[0].beforeid = id;
				} else {
					// 2枚目 //
					this.cards[id-1].isopened = true;
					this.count[0].afterid = id;
					this.count[0].clicknum += 1;
					this.count[0].turnnum += 1;
					if (this.cards[this.count[0].beforeid - 1].num == this.cards[id-1].num) {
						setTimeout(hitset, 1200, this.cards, this.count);
					} else {
						setTimeout(reset, 3000, this.cards, this.count);
					}
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
	width: 150px;
	height: 200px;
}

.opened {
	border: 1px solid red;
	transform: rotateY( 180deg );
	transition: transform 1s ease;
	background-image:url(./images/card_back.png);
	background-repeat: no-repeat;
	width: 150px;
	height: 200px;
	content: none;
	text-indent:100%;
	white-space:nowrap;
	overflow:hidden;
}

.hitted {
	transition-delay: 2.0s;
	transform: rotateY( 180deg );
	transition: transform 1s ease;
	background-color: gray;
}
</style>
