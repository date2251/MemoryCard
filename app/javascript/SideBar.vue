<template>
	<div style="width: 15%; margin-left: 10px">
		<ul class="inner">
			<li><img :src="images[4].src"></li>
			<li><router-link :to="{ name: 'Home' }"><img :src="images[5].src"></router-link></li>
			<li><router-link :to="{ name: 'RankingPage' }"><img :src="images[1].src"></router-link></li>
			<li>
				<button v-on:click="openRule"><img :src="images[0].src"></button>
				<div id="overlay" v-show="ruleModal">
					<div id="content">
   					<p>26枚のカードが裏向きでバラバラに並べられています。プレイヤーはその中から2枚をめくり、その2枚が同じ番号だった場合カードが消えます。全てのカードを消す事が出来ればゲームクリアです。</p>
						<button v-on:click="closeRule" style="background-color: gray; width: 100px; height: 50px; color: white;">閉じる</button>
					</div>
				</div>
			</li>
			<li><a href="#"><img :src="images[2].src"></a></li>
			<li><a href="#"><img :src="images[3].src"></a></li>
		</ul>
	</div>
</template>

<script>
import ruleimg from "../assets/images/rule.png"
import usageimg from "../assets/images/usage.png"
import rankingimg from "../assets/images/ranking.png"
import frameworkimg from "../assets/images/framework.png"
import categoryimg from "../assets/images/category.png"
import homeimg from "../assets/images/home.png"

export default {
	data: function () {
		return {
			images: [
				{src: ruleimg},
				{src: rankingimg},
				{src: usageimg},
				{src: frameworkimg},
				{src: categoryimg},
				{src: homeimg}
			],
			ruleModal: false
		}
	},
	methods: {
		openRule: function () {
			this.ruleModal = true
		},
		closeRule: function () {
			this.ruleModal = false
		}
	}
}
</script>

<style scoped>
ul {
	min-height: 590px;
	margin: 0;
	padding: 10px 10px;
	overflow: hidden;
	list-style: none;
	background-color: gray;
	text-align: center;
}

li {
	margin: 5px;
}

a {
	color: white;
	text-decoration: none;
}

button {
  padding: 0;
  border: none;
  background: transparent;
	cursor: pointer;
}

button:focus {
	outline: none;
}

button img {
  display: block;
}

#overlay{
  /*　要素を重ねた時の順番　*/
  z-index:1;

  /*　画面全体を覆う設定　*/
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background-color:rgba(0,0,0,0.5);

  /*　画面の中央に要素を表示させる設定　*/
  display: flex;
  align-items: center;
  justify-content: center;
}

#content{
  z-index:2;
  width:50%;
  padding: 1em;
  background:#fff;
}
</style>
