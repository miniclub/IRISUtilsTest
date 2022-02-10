/// 同期前のクライアント状態をチェック
Class UnitTest.CheckClient Extends %UnitTest.TestCase
{

/// Test.Client.TestIFのインスタンス
Property rem As Test.Client.TestIF;

/// テスト開始前の処理
Method OnBeforeAllTests() As %Status
{
    Set sc = $$$OK
    set ..rem=##class(Test.Client.TestIF).%New("192.168.0.63",52773)
    set:'$isobject(..rem) sc=%objlasterror
    Return sc
}

/// Test1
Method Test1()
{
    set ret=..rem.Test1("parameter")
    do $$$AssertStatusOK(ret,"Test1呼び出し結果")
}

/// Test1
/// 日本語パラメータ
Method Test1Jp()
{
    set ret=..rem.Test1("日本語パラメータ")
    do $$$AssertStatusOK(ret,"Test1呼び出し結果")
}

/// Test1A
/// 戻り値のない関数
Method Test1A()
{
    do ..rem.Test1A("日本語データ")
}

/// エラーを返す関数
Method Test1B()
{
    set ret=..rem.Test1B("エラーチェック関数")
    do $$$AssertStatusNotOK(ret,"Test1B呼び出し結果")
}

/// エラートラップが発生する関数
Method Test1C()
{
    try {
        set ret=$$$OK
        do ..rem.Test1C("引数データ")
    } catch err {
        set ret=err.AsStatus()
    }
    do $$$AssertStatusNotOK(ret,"Test1Cでエラートラップ発生")
}

/// 参照渡しの引数を持つ関数
Method Test2()
{
    set refdata="クライアントデータ"
    set ret=..rem.Test2("12345",.refdata)
    do $$$AssertStatusOK(ret,"Test2呼び出し結果")
    do $$$AssertEquals(refdata,"参照データ","参照値が変更されたかどうか")
}

/// 出力引数を持つ関数
Method Test3()
{
    set num=991.212
    do ..rem.Test3("12345",.num,.str)
    do $$$AssertEquals(num,162.32,"参照値が正しく戻ってきたかどうか")
    do $$$AssertEquals(str,"日本語データ","参照値が戻ってきたかどうか")
}

}
