/// 同期前のサーバ状態をチェック
Class UnitTest.CheckServer Extends %UnitTest.TestCase
{

/// ダウンロード前の状態チェック
Method TestParameters()
{
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1",1)),"日本語パラメータ","Test1引数チェック")
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1","ret")),$$$OK,"Test1戻り値チェック")

    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1A",1)),"日本語データ","Test1A引数チェック")

    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1B",1)),"エラーチェック関数","Test1B引数チェック")

    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1C",1)),"引数データ","Test1C引数チェック")

    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test2",1)),"12345","Test2引数チェック")
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test2",2)),"クライアントデータ","Test2引数チェック")

    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test3",1)),"12345","Test3引数チェック")
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test3",2)),991.212,"Test3引数チェック(数値)")
}

}
