*** Settings ***
Resource          登录业务.txt

*** Test Cases ***
01登录成功
    登录流程
    ${test}    Get text    //*[@id="header"]/div[3]/a[2]/span
    should contain    ${test}    注销    #断言是否登陆成功    #should contain \ 是否包含 a是否包含b    #should be true \ 是否等于；判断是否
    关闭浏览器

02用户名为空
    登录流程    un=\
    隐式等待
    ${test}    Get text    Xpath=//*[@class="alert alert-danger"]
    should contain    ${test}    用户名或密码错误
    关闭浏览器

03密码为空
    登录流程    pw=\
    隐式等待
    ${test}    Get text    Xpath=//*[@class="alert alert-danger"]
    should contain    ${test}    用户名或密码错误
    关闭浏览器

04用户名错误
    登录流程    admins    123456
    隐式等待
    ${test}    Get text    Xpath=//*[@class="alert alert-danger"]
    should contain    ${test}    用户名或密码错误
    关闭浏览器

05密码错误
    登录流程    admin    1234567
    隐式等待
    ${test}    Get text    Xpath=//*[@class="alert alert-danger"]
    should contain    ${test}    用户名或密码错误
    关闭浏览器
