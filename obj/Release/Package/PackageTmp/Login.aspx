<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SimpleSampleCRUD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
    margin-left: 36%;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
            
        <div class="row" id="css">
        <div class="col-sm-12">
            <span id="lg">Login</span>
            <hr />
        </div>
            <div class="col-md-6">
                  <label>User Name</label><span style="color:red">*</span>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" placeholder="User Name" />
            </div>
            <br />
                    <div class="col-md-6">
                  <label>Password</label><span style="color:red">*</span>
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control" placeholder="Password"/>
            </div>
     

       
       <br />
        <input type="button" id="subbtn" class="btn btn-success" value="Submit" />
              </div>
      </div>
    </form>
</body>
</html>
