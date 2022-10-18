<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="SimpleSampleCRUD.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page</title>
         <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            // alert('Welcome Main Page')
            $('#divtopadd').hide();
        })

        function Hideeditdelete()
        {
            debugger;
            $('#edtibtn').toggle();
            $('#deletebtn').toggle();
            $('#divtopadd').toggle();
        }
    </script>

    <script>
        function Editbtnfn() {
            debugger
            //alert('Test')
            var _Search_txt = $('#search_txt').val().toString().trim();
            
            $.ajax({
                type : "Post",
                url : "WebService1.asmx/Editfunction",
                data: "{'_Search_txt':'" + _Search_txt + "'}",
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success:function(result){
                    debugger
                    var name = result.data;
                }
                });
        }

    </script>

    <style>
        #headdetails{
            font-size: xx-large;
            margin-left: 51%;
}
        #uname{    margin-left: 88%;
                  font-size: x-large;
}
        #divtop{
     background-color:aliceblue;
        }
        #divtopadd{
             background-color:aliceblue;
        }
        #addbtn{
            margin-top:7%;
        }
        #search_btn {
            margin-top: 18px;
        }
        #divtopsearch{
                         background-color:aliceblue;

        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container" id="divtop">
            <div class="row">
                <div class="col-lg-6">
                    <label id="headdetails">Employee Details</label>
                </div>
                <div class="col-lg-6">
                    <span id="uname">Sai</span>
                </div>
            </div>
            <hr />
            <div class="col-sm-3">
                <input type="button" value="Add Employee" class="btn btn-success" onclick="Hideeditdelete()" />
            </div>
            <div class="col-sm-3">
                <input type="button" id="edtibtn" value="Edit Employee" class="btn btn-info" onclick="Editbtnfn()" />
            </div>
           <%-- <div class="col-sm-3">
                <input type="button"  id="deletebtn" value=" Delete Emplyee Deatils" class="btn btn-danger" />
            </div>--%>
        </div>

        <div class="container" id="divtopadd">
            <hr />
            <h4>Please Employee Details</h4>
            <div class="row">
                <div class="col-md-3">
                    <span>Employee Name</span>
                    <input type="text" class="form-control" id="emp_name_txt" runat="server" />
                </div>
                 <div class="col-md-3">
                    <span>Employee Address</span>
                    <input type="text" class="form-control" id="emp_add_txt" runat="server"/>
                </div>
                 <div class="col-md-3">
                    <span>Employee DOB</span>
                    <input type="text" class="form-control" id="emp_dob_txt" runat="server" />
                </div>
                 <div class="col-md-3">
                    <span style="display:none">Employee DOB</span>
                    <input type="button" id="addbtn" class="btn btn-success" value="Add Details" runat="server" onserverclick="addbtn_ServerClick" />
                </div>
            </div>
        </div>


        <div class="container" id="divtopsearch">
            <div class="row">
                <div class="col-lg-4">
                    <span>Please enter name</span>
                  <input type="text" id="search_txt" class="form-control" placeholder="Please enter the name" />
                </div>
                <div class="col-lg-4">
                    <input type="button" id="search_btn" value="Search" class="btn btn-info" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>
