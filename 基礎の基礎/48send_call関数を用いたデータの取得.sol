function getZombieDetails(id) {
  return cryptoZombies.methods.zombies(id).call()
}

// 関数を呼び出し、その結果を処理する:
getZombieDetails(15)
.then(function(result) {
  console.log("Zombie 15: " + JSON.stringify(result));
});

//cryptoZombies.methods.zombies(id).call() はWeb3プロバイダのノードと通信して、コントラクトにあるZombie[] public zombiesからゾンビとそのインデックスidを返す。
//Web3はここでpromiseを返す。
//Promiseがリゾルブすると(Web3プロバイダからの応答を受けとったという意味だ)、この見本コードはthenステートメントで続行され、resultをコンソールにログする。
//result は次のようなjavascriptオブジェクト
{
  "name": "H4XF13LD MORRIS'S COOLER OLDER BROTHER",
  "dna": "1337133713371337",
  "level": "9999",
  "readyTime": "1522498671",
  "winCount": "999999999",
  "lossCount": "0" // Obviously.
}
