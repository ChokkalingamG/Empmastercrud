<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SimpleSampleCRUD.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        #css{
       width: 30%;
       margin-top: 22%;
       margin-left:34%;
       border: outset;
        }
        #subbtn{
            margin-left:54%;
        }

        #lg{
     font-size: x-large;
    color: blueviolet;
    margin-left: 24%;
        }
        .spanclass{
            color: red;
        }
    </style>
    <script>

        function validation() {
            debugger;
            var User_Name = document.getElementById("Name_Txt").value;
            var Pass_word = document.getElementById("Pass_Txt").value;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row" id="css">
                <div class="col-sm-12">
                    <span id="lg">Registration</span>
                    <hr />
                </div>
                <div class="col-md-6">
                    <label>User Name</label><span class="spanclass">*</span>
                </div>
                <div class="col-sm-6">
                    <input type="text"  id="Name_Txt" class="form-control" placeholder="User Name" runat="server" />
                </div>
                <br />
                <div class="col-md-6">
                    <label>Password</label><span  class="spanclass">*</span>
                </div>
                <div class="col-sm-6">
                    <input type="password" id="Pass_Txt" class="form-control" placeholder="Password" runat="server" />
                </div>
                <br />
                <input type="button" id="subbtn" class="btn btn-success" value="Submit" runat="server" onserverclick="subbtn_ServerClick" />
            </div>
        </div>
    </form>
</body>
</html>
