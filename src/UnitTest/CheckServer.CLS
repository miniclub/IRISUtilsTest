/// 同期前のサーバ状態をチェック
Class UnitTest.CheckServer Extends %UnitTest.TestCase
{

/// Test1のパラメータチェック
Method ParamTest1()
{
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1",1)),"日本語パラメータ","Test1引数チェック")
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1","ret")),$$$OK,"Test1戻り値チェック")
}

/// Test1の日本語パラメータチェック
Method ParamTest1jp()
{

    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1A",1)),"日本語データ","Test1A引数チェック")
}

/// Test1bのパラメータチェック
Method ParamTest1b()
{
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1B",1)),"エラーチェック関数","Test1B引数チェック")
}

/// Test1cのパラメータチェック
Method ParamTest1c()
{
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test1C",1)),"引数データ","Test1C引数チェック")
}

/// Test2のパラメータチェック
Method ParamTest2()
{
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test2",1)),"12345","Test2引数チェック")
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test2",2)),"クライアントデータ","Test2引数チェック")
}

/// Test3のパラメータチェック
Method ParamTest3()
{
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test3",1)),"12345","Test3引数チェック")
    do $$$AssertEquals($get(^Args("Test.Remote.TestIF","Test3",2)),991.212,"Test3引数チェック(数値)")
}

}
