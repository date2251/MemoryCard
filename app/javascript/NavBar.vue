<template>
	<header>
		<nav id="gnav">
			<ul class="inner">
				<li><a href="#">ホーム</a></li>
				<li><router-link :to="{ name: 'RankingPage' }">ランキング</router-link></li>
				<li><a href="#">２ページ目</a></li>
				<li><a href="#">３ページ目</a></li>
				<li><a href="#">会社概要</a></li>
			</ul>
		</nav>
	</header>
</template>

<script>
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
</style>
