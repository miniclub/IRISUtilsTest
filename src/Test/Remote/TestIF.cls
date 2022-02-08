Include Test.Include

/// リモート呼び出し
/// テストクラス
Class Test.Remote.TestIF Extends %ZComm.Common.ServerBase
{

ClassMethod Test1(data As %String) As %Status
{
    set ret=$$$OK
    set $$$Args(1)=data
    set $$$Args("ret")=ret
	quit ret
}

ClassMethod Test1A(data As %String)
{
    set ret=$$$OK
    set $$$Args(1)=data
    set $$$Args("ret")=ret
	quit
}

ClassMethod Test1B(data As %String) As %Status
{
    set ret=$$$ERROR(5001,"エラーステータステスト")
    set $$$Args(1)=data
    set $$$Args("ret")=ret
	quit ret
}

ClassMethod Test1C(data As %String)
{
    set ret=$$$ERROR(5001,"エラーステータステスト")
    set $$$Args(1)=data
    set $$$Args("ret")=ret
	set data=x // UNDEFエラー発生
	quit ret
}

ClassMethod Test2(data As %String, ByRef refdata As %String) As %Status
{
    set ret=$select($length(data)>10:$$$ERROR(5001,"エラーステータステスト"),1:$$$OK)
    set $$$Args(1)=data
    set $$$Args(2)=refdata
	set refdata="参照データ"
    set $$$Args("ret")=ret
	quit ret
}

ClassMethod Test3(data As %String, ByRef num As %Numeric, Output str As %String)
{
    set $$$Args(1)=data
    set $$$Args(2)=num
	set str="日本語データ"
	set num=162.32
}

Parameter InterfaceModule = "test";

ClassMethod DeleteArgs()
{
    kill ^Args
}

}
