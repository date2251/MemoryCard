<template>
  <div id="app" style="position: relative;">
    <!-- クリア前 -->
    <div v-if ='count[0].hitnum < 13'>
      <div style="color: white">試行回数：{{count[0].turnnum}}</div>
      <table>
        <tr>
          <td v-for="i in 9" :key="i">
            <div v-on:click='isClick(i)' v-bind:class='{card: !cards[i-1].isopened, opened:cards[i-1].isopened, hitted:cards[i-1].ishit}'>
              <img :src="cards[i-1].src">
            </div>
          </td>
        </tr>
        <tr>
          <td v-for="i in 9" :key="i">
            <div v-on:click='isClick(i+9)' v-bind:class='{card: !cards[i+8].isopened, opened:cards[i+8].isopened, hitted:cards[i+8].ishit}'>
              <img :src="cards[i+8].src">
            </div>
          </td>
        </tr>
        <tr>
          <td v-for="i in 8" :key="i">
            <div v-on:click='isClick(i+18)' v-bind:class='{card: !cards[i+17].isopened, opened:cards[i+17].isopened, hitted:cards[i+17].ishit}'>
              <img :src="cards[i+17].src">
            </div>
          </td>
        </tr>
      </table>
    </div>
    <!-- クリア後 -->
    <div v-else>
      <p class="resulttitle">Clear</p>
      <p>試行回数：{{count[0].turnnum}}</p>
      <div class="resultbtnwrap">
        <button class="resultbtn" @click='replay()'>もう一度遊ぶ</button>
        <button class="resultbtn" @click='register()'>結果を登録する</button>
        <form v-if ='count[0].regflg' @submit.prevent="registerpost" class="form__control">
          <label for="" class="form__label">名前：</label>
          <input class="form__input" v-model='count[0].user_name' type="text" name="user_name">
          <button type="submit">登録</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import image1 from "./assets/images/1.png"
import image2 from "./assets/images/2.png"
import image3 from "./assets/images/3.png"
import image4 from "./assets/images/4.png"
import image5 from "./assets/images/5.png"
import image6 from "./assets/images/6.png"
import image7 from "./assets/images/7.png"
import image8 from "./assets/images/8.png"
import image9 from "./assets/images/9.png"
import image10 from "./assets/images/10.png"
import image11 from "./assets/images/11.png"
import image12 from "./assets/images/12.png"
import image13 from "./assets/images/13.png"
import image14 from "./assets/images/14.png"
import image15 from "./assets/images/15.png"
import image16 from "./assets/images/16.png"
import image17 from "./assets/images/17.png"
import image18 from "./assets/images/18.png"
import image19 from "./assets/images/19.png"
import image20 from "./assets/images/20.png"
import image21 from "./assets/images/21.png"
import image22 from "./assets/images/22.png"
import image23 from "./assets/images/23.png"
import image24 from "./assets/images/24.png"
import image25 from "./assets/images/25.png"
import image26 from "./assets/images/26.png"

export default {
  data: function () {
    return {
      cards: [
        {id: 1, num: 1, mark: 'spade', isopened: false, ishit: false, src: image1},
        {id: 2, num: 2, mark: 'spade', isopened: false, ishit: false, src: image2},
        {id: 3, num: 3, mark: 'spade', isopened: false, ishit: false, src: image3},
        {id: 4, num: 4, mark: 'spade', isopened: false, ishit: false, src: image4},
        {id: 5, num: 5, mark: 'spade', isopened: false, ishit: false, src: image5},
        {id: 6, num: 6, mark: 'spade', isopened: false, ishit: false, src: image6},
        {id: 7, num: 7, mark: 'spade', isopened: false, ishit: false, src: image7},
        {id: 8, num: 8, mark: 'spade', isopened: false, ishit: false, src: image8},
        {id: 9, num: 9, mark: 'spade', isopened: false, ishit: false, src: image9},
        {id: 10, num: 10, mark: 'spade', isopened: false, ishit: false, src: image10},
        {id: 11, num: 11, mark: 'spade', isopened: false, ishit: false, src: image11},
        {id: 12, num: 12, mark: 'spade', isopened: false, ishit: false, src: image12},
        {id: 13, num: 13, mark: 'spade', isopened: false, ishit: false, src: image13},
        {id: 14, num: 1, mark: 'club', isopened: false, ishit: false, src: image14},
        {id: 15, num: 2, mark: 'club', isopened: false, ishit: false, src: image15},
        {id: 16, num: 3, mark: 'club', isopened: false, ishit: false, src: image16},
        {id: 17, num: 4, mark: 'club', isopened: false, ishit: false, src: image17},
        {id: 18, num: 5, mark: 'club', isopened: false, ishit: false, src: image18},
        {id: 19, num: 6, mark: 'club', isopened: false, ishit: false, src: image19},
        {id: 20, num: 7, mark: 'club', isopened: false, ishit: false, src: image20},
        {id: 21, num: 8, mark: 'club', isopened: false, ishit: false, src: image21},
        {id: 22, num: 9, mark: 'club', isopened: false, ishit: false, src: image22},
        {id: 23, num: 10, mark: 'club', isopened: false, ishit: false, src: image23},
        {id: 24, num: 11, mark: 'club', isopened: false, ishit: false, src: image24},
        {id: 25, num: 12, mark: 'club', isopened: false, ishit: false, src: image25},
        {id: 26, num: 13, mark: 'club', isopened: false, ishit: false, src: image26}
      ],
      // カウント変数 //
      count: [
        {clicknum: 0, beforeid: 0, afterid: 0, turnnum: 0, hitnum: 0, regflg: false}
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
    // 答え //
    console.log(this.cards.map((obj) => obj.num)); //
  },
  methods: {
    isClick: function (id) {
      // 3秒後に裏にする関数 //
      var reset = function (cards, cnt) {
        cards[cnt[0].beforeid - 1].isopened = false;
        cards[cnt[0].afterid - 1].isopened = false;
        cnt[0].clicknum = 0;
      }
      // 1秒後にヒットにする関数 //
      var hitset = function (cards, cnt) {
        cards[cnt[0].beforeid - 1].ishit = true;
        cards[cnt[0].afterid - 1].ishit = true;
        cnt[0].clicknum = 0;
        cnt[0].hitnum += 1;
      }

      // 2枚以上はめくれない //
      if (this.count[0].clicknum < 2) {
        if (this.count[0].clicknum == 0) {
          // 1枚目 //
          this.cards[id-1].isopened = true;
          this.count[0].clicknum += 1;
          this.count[0].beforeid = id;
        } else if (id != this.count[0].beforeid) {
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
    },
    // リプレイ時リロード //
    replay: function () {
      this.$router.go({path: this.$router.currentRoute.path, force: true})
    },
    // ランキング登録選択 //
    register: function () {
      this.count[0].regflg = true;
    },
    // ランキング登録API //
    registerpost: function () {
      this.$axios
        .post('/api/v1/rankings', { 'ranking' : {
          user_name: this.count[0].user_name,
          try_num: this.count[0].turnnum
        }})
        .then(function (response) {
          console.log(response)
          window.location.replace('/#/ranking')
        })
        .catch(function (error) {
          console.log(error);
        })
    }
  }
}

</script>

<style scoped>
p {
  color: white;
}

.resulttitle {
  font-size: 3em;
  text-align: center;
}

img {
  width: 100%;
  vertical-align: middle;
}

.card {
  background-image:url(./images/card_back.png);
  background-repeat: no-repeat;
  background-size: contain;
  background-position:center;
  width: 100%;
  content: none;
  text-indent:100%;
  white-space:nowrap;
  overflow:hidden;
}

.opened {
  transform: rotateY( 180deg );
  transition: transform 1s ease;
}

.hitted {
  transition-delay: 2.0s;
  transform: rotateY( 180deg );
  transition: transform 1s ease;
  visibility: hidden;
}

.resultbtnwrap {
  text-align: center;
}

.resultbtn {
  width: 150px;
  height: 50px;
}
</style>
