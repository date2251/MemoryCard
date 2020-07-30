<template>
	<div style="width: 15%; margin-left: 10px">
		<ul class="inner">
			<li><img :src="images[4].src"></li>
			<li><router-link :to="{ name: 'Home' }"><img :src="images[5].src"></router-link></li>
			<li><a href="#"><img :src="images[0].src"></a></li>
			<li><router-link :to="{ name: 'RankingPage' }"><img :src="images[1].src"></router-link></li>
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
			]
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

li img {
	width: 100%;
}

a {
	color: white;
	text-decoration: none;
}
</style>
