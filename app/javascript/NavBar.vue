<template>
	<header>
		<nav id="gnav">
			<ul class="inner">
				<li><router-link :to="{ name: 'Home' }">ホーム</router-link></li>
				<li><router-link :to="{ name: 'RankingPage' }">ランキング</router-link></li>
				<li id="rule">
					<button v-on:click="openRule">ルール</button>
					<div id="overlay" v-show="ruleModal">
						<div id="content">
   					  <p>26枚のカードが裏向きでバラバラに並べられています。プレイヤーはその中から2枚をめくり、その2枚が同じ番号だった場合カードが消えます。全てのカードを消す事が出来ればゲームクリアです。</p>
   					  <button class="modalnav" v-on:click="closeRule">閉じる</button>
   					</div>
    			</div>
				</li>
				<li><a href="#">操作説明</a></li>
				<li><a href="#">FrameWork</a></li>
			</ul>
		</nav>
	</header>
</template>

<script>
export default {
  data: function () {
		return {
    	ruleModal: false
		}
  },
  methods:{
    openRule: function(){
      this.ruleModal = true
    },
    closeRule: function(){
      this.ruleModal = false
    }
  }
}
</script>

<style scoped>
ul {
	height: 50px;
	margin-top: 0;
	overflow: hidden;
	list-style: none;
	background-color: gray;
	text-align: center;
	align-items: center;
	display: flex;
}

li {
	float: left;
	width: 100px;
}

a {
	color: white;
	text-decoration: none;
}

button {
	color: white;
  box-sizing: initial;
  background-color: gray;
  font: initial;
  border: initial;
  cursor: pointer;
}

button:focus {
	outline: none;
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

.modalnav {
	width: 100px;
	height: 50px;
}
</style>
