//this
this;
this.balance;
this.someFunction();

//meg
msg.sender; //senderのアドレスを表示
msg.value; //コントラクトのwei量を表示
msg.data; //bytesを表示
msg.gas; //ガス残量表示

//tx
tx.origin; //トランザクションのsenderのアドレスを表示
tx.gasproce; //トランザクションのgas priceを表示

//now ブロックの情報を表示
now; //現在の時間を返す
block.number; //現在のブロックナンバーを返す
block.difficulty; //現在のブロックのdifficultyを表示する
block.blockhash(1); //１番最新のhashを返す
block.gasLimit();
