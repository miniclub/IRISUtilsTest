/// 同期前のクライアント状態をチェック
Class UnitTest.CheckClient Extends %UnitTest.TestCase
{

/// 単純な呼び出し
Method TestSimpleArg()
{
    set rem=##class(Test.Client.TestIF).%New("192.168.0.63",52773)
    do $$$AssertTrue($isobject(rem),"リモート接続インスタンスが作成されたかどうか")

    set ret=rem.Test1("patameter")
    do $$$AssertStatusOK(ret,"Test1呼び出し結果")

    set ret=rem.Test1("日本語パラメータ")
    do $$$AssertStatusOK(ret,"Test1呼び出し結果")

    // 戻り値のない関数
    do rem.Test1A("日本語データ")

    // エラーを返す関数
    set ret=rem.Test1B("エラーチェック関数")
    do $$$AssertStatusNotOK(ret,"Test1B呼び出し結果")

    try {
        set ret=$$$OK
        do rem.Test1C("引数データ")
    } catch err {
        set ret=err.AsStatus()
    }
    do $$$AssertStatusNotOK(ret,"Test1Cでエラートラップ発生")

    set refdata="クライアントデータ"
    set ret=rem.Test2("12345",.refdata)
    do $$$AssertStatusOK(ret,"Test2呼び出し結果")
    do $$$AssertEquals(refdata,"参照データ","参照値が変更されたかどうか")

    set num=991.212
    set ret=rem.Test3("12345",.num,.str)
    do $$$AssertStatusOK(ret,"Test3呼び出し結果")
    do $$$AssertEquals(num,162.32,"参照値が正しく戻ってきたかどうか")
    do $$$AssertEquals(str,"日本語データ","参照値が戻ってきたかどうか")
}

}
