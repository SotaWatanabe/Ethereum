uint lastUpdated;

//  `lastUpdated` を `now`に設定する
function updateTimestamp() public {
  lastUpdated = now;
}

// `updateTimestamp`が呼ばれてから5分経っていれば、`true`が返る。
// 5分経っていなければ、`false`が返る。
function fiveMinutesHavePassed() public view returns (bool) {
  return (now >= (lastUpdated + 5 minutes));
}
