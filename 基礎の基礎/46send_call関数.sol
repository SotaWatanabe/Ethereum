//ここまでのセットアップでweb3.jsを通してコントラクトにアクセスできるようになった
//Web3.jsはコントラクトの関数を呼び出す為のメソッド、callとsendを持っている

//callはview関数およびpure関数に使われる。
//ローカルのノードでのみ機能し、ブロックチェーン上のトランザクションを生成しない。

//Web3.jsを使って、次のように123をパラメーターにしてmyMethodという名の関数をcallできる:
myContract.methods.myMethod(123).call()

//sendはトランザクションを生成し、ブロックチェーン上のデータを変更する。
//viewまたはpureではない関数には、sendを使う必要がある。
//Web3.jsを使って、次のように123をパラメーターにして、myMethodという名の関数を呼び出すトランザクションをsendすることができる:
myContract.methods.myMethod(123).send()
