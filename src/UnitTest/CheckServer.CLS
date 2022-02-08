/// 同期前のサーバ状態をチェック
Class UnitTest.CheckServer Extends %UnitTest.TestCase
{

/// ダウンロード前の状態チェック
Method TestBeforeDownload()
{
    set key="" for {
        set key=$order(^|$get(^%ZUtils.Config("SYNCNS"))|OBJ.Server(key),1,data)
        quit:key=""
        do $$$AssertTrue($lg(data,3)=$lg(data,4),"同期開始TranIDと同期完了TranIdが同じ")
        do $$$AssertEquals(##class(%ZUtils.SyncData).GetStatus(key),0,"停止中かどうか")
    }
}
/// ダウンロード後の状態チェック
Method TestAfterDownload()
{
    set key="" for {
        set key=$order(^|$get(^%ZUtils.Config("SYNCNS"))|OBJ.Server(key),1,data)
        quit:key=""
        do $$$AssertTrue($lg(data,3)>0&&($lg(data,3)=$lg(data,4)),"同期開始TranIDと同期完了TranIdが同じ")
        do $$$AssertEquals(##class(%ZUtils.SyncData).GetStatus(key),1,"稼働中かどうか")
    }
}
/*/// コンフィグのチェック
Method Test2()
{
    do $$$LogMessage("^%ZUtils.Configに正しい値が入っているかをチェック")
    do $$$AssertEquals($get(^%ZUtils.Config("MASTERIP")),"192.168.10.3","マスターの代表アドレス")
    do $$$AssertEquals($get(^%ZUtils.Config("DEPLOYDBLIST")),"PGM,MASTER","配布DBリスト")
    do $$$AssertEquals($get(^%ZUtils.Config("SYNCDBLIST")),"DATA1,DATA2","同期DBリスト")
    do $$$AssertEquals($get(^%ZUtils.Config("SYNCNS")),"APP","同期ネームスペース")
    do $$$AssertNotEquals($get(^%ZUtils.Config("SERVERGUID")),##class(%SYS.System).InstanceGUID(),"マスターのGUIDとクライアントのGUIDは異なっていないといけない")
	quit
}
/// オブジェクト同期グローバルのチェック
Method TestSyncSet()
{
    do $$$AssertEquals($get(^%ZUtils.SyncCli("SYNCNUM")),1,"同期IDチェック")
    do $$$AssertEquals($get(^%ZUtils.SyncCli("CLIENTTRANID")),"","トランザクションIDがNULL")
    do $$$AssertEquals($get(^%ZUtils.SyncCli("SYNCSTATUS")),0,"ステータスが0")
    do $$$AssertEquals($data(^OBJ.SYNCC.1),0,"^OBJ.SYNC.1が無いこと")
	quit
}*/

}
