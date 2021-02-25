<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplicationTest._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <script type="text/javascript">
     
     function successalert() {
         swal({
             title: "Success Added",
             text: "The Member added Successfully",
             icon: "success",
             button: "OK",
         });
     }
    </script>
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
  <br /> <br /> 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
    
    <div class="col-xs-9">

       
            <div class="form-group">
                <div class="col-xs-6">
                     <asp:TextBox ID="TextBox2" class="form-control" placeholder="بحث عن البريد..." runat="server"></asp:TextBox>
                </div>
                <div class="col-xs-6">
                    
                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="بحث عن البريد..." runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Require" ControlToValidate="TextBox1" ValidationGroup="add"></asp:RequiredFieldValidator>
                </div>
            </div>
           
            <br /> <br />
         <div class="col-xs-6">
         <asp:DropDownList id="ColorList"
                    AutoPostBack="True"
                   
                    runat="server">

                  <asp:ListItem Text="Selecte Value" Value="0">  </asp:ListItem>
                 

               </asp:DropDownList>
             </div>
        <br /> <br />
            <div class="col-xs-2" >
                
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Save" OnClick="SaveOne" ValidationGroup="add" /><i class="fa fa-search"></i>
            </div>
        
    </div>
               
   
                <div class="col-xs-12" style="text-align: left;">
                    
                                        <asp:Panel ID="Panel6" runat="server" Style="max-height: 300px;" ScrollBars="Auto">
                                            
                                            <asp:GridView Style="direction: ltr;" OnPageIndexChanging="GridView1_PageIndexChanging" 
                                                AllowPaging="true" AllowSorting="true" PageSize = "4" ID="GVPrimaryNurse" runat="server" AutoGenerateColumns="False"
                                                CellPadding="4" CssClass="table table-striped table-hover table-bordered table-HeaderLeft"
                                                DataKeyNames="id" >

                                                <Columns>
                                                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                                        <HeaderTemplate>Hello</HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Name" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Right" />
                                                        <ItemStyle HorizontalAlign="left" Width="80%" CssClass="en" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnPrimaryNurseSelect" OnClick="SaveClick" OnClientClick="return confirm('are you sure you Want delete this Item  ?');" CssClass="btn btn-success btn-sm" runat="server" 
                                                                Text="Select" CausesValidation="False" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                    </asp:TemplateField>
                                                </Columns>

                                            </asp:GridView>
                                        </asp:Panel>


                                    </div>
</div>
        </ContentTemplate>
        
    </asp:UpdatePanel>




</asp:Content>
