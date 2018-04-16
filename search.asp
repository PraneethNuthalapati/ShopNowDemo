<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>GP Helpdesk Searh</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>

<body>
<img src="images/search/right-title-search.gif" alt="search">
				  <form name="search" method="post" action="search.asp">
                    <input name="query" type="text" size="12">
                   	<input name="submit" type="image" value="submit" src="images/search/right-go.gif" alt="alt" align="absmiddle">
                  </form>
            <table width="420" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="16" align="left" valign="top">&nbsp;</td>
              </tr>
              <tr>
                <td align="left" valign="top"></td>
              </tr>
              <tr>
                <td height="10" align="left" valign="middle"> <img src="images/search/horizontal-rule-long.gif" width="420" height="1"></td>
              </tr>
              <tr>
                <td height="327" align="left" valign="top">



			     <table width="400" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="25"><img src="images/search/pix.gif" width="25" height="1"></td>

					  <td width="375" valign="top" align="left">
					  <%
							'
							' *** Modifying the Form's Search Scope.
							'
							' The form will search from the root of your web server's namespace and below
							' (deep from "/" ). To search a subset of your server, for example, maybe just
							' a PressReleases directory, modify the scope variable below to list the virtual path to
							' search. The search will start at the directory you specify and include all sub-
							' directories.
							'
							' Modified July 7, 2008: Dan Iwasaki - Limit Search Scope to /APHelpdesk/ folder

							        FormScope = "/APHelpdesk/"

							'
							' *** Modifying the Number of Returned Query Results.
							'
							' You can set the number of query results returned on a single page
							' using the variable below.

							        PageSize = 10

							'
							' *** Setting the Locale.
							'
							' The following line sets the locale used for queries. In most cases, this
							' should match the locale of the server. You can set the locale below.

							        SiteLocale = "EN-US"

							' ********** END QUICK CUSTOMIZATION SECTIONS ***********
							%> <%
						' Set Initial Conditions
						    NewQuery = FALSE
						    UseSavedQuery = FALSE
						    SearchString = ""

						    QueryForm = Request.ServerVariables("PATH_INFO")

						' Did the user press a SUBMIT button to execute the form? If so get the form variables.
						    if Request.ServerVariables("REQUEST_METHOD") = "POST" then
								SearchString = Request.Form("query")
								If SearchString = "" then
						           SearchString = "GPAP"
						        end if

						        FreeText = Request.Form("FreeText")
						        ' NOTE: this will be true only if the button is actually pushed.
						       ' if Request.Form("Action") = "Go" then
						            NewQuery = TRUE
									RankBase=1000
						        'end if
						    end if
						    if Request.ServerVariables("REQUEST_METHOD") = "GET" then
						        SearchString = Request.QueryString("qu")
						                FreeText = Request.QueryString("FreeText")
						                FormScope = Request.QueryString("sc")
										RankBase = Request.QueryString("RankBase")
						        if Request.QueryString("pg") <> "" then
						            NextPageNumber = Request.QueryString("pg")
						            NewQuery = FALSE
						            UseSavedQuery = TRUE
						        else
						            NewQuery = SearchString <> ""
						        end if
						    end if
						%> <%
						  if NewQuery then
						    set Session("Query") = nothing
						    set Session("Recordset") = nothing
						    NextRecordNumber = 1

						' Remove any leading and ending quotes from SearchString

						        SrchStrLen = len(SearchString)

						        if left(SearchString, 1) = chr(34) then
						                SrchStrLen = SrchStrLen-1
						                SearchString = right(SearchString, SrchStrLen)
						        end if

						        if right(SearchString, 1) = chr(34) then
						                SrchStrLen = SrchStrLen-1
						                SearchString = left(SearchString, SrchStrLen)
						        end if

						    if FreeText = "on" then
						      CompSearch = "$contents " & chr(34) & SearchString & chr(34)
						    else
						      CompSearch = chr(34) & SearchString & chr(34)
						    end if

						    set Q = Server.CreateObject("ixsso.Query")
						    set util = Server.CreateObject("ixsso.Util")

						    Q.Catalog = "GPHelpdesk"
						    Q.Query = CompSearch

						    Q.SortBy = "rank[d]"
						    Q.Columns = "DocTitle, vpath, filename, size, write, characterization, rank"
							Q.MaxRecords = 300


						        if FormScope <> "/" then
						                util.AddScopeToQuery Q, FormScope, "deep"
						        end if

						        if SiteLocale<>"" then
						                Q.LocaleID = util.ISOToLocaleID(SiteLocale)
						        end if

						    set RS = Q.CreateRecordSet("nonsequential")

						    RS.PageSize = PageSize
						    ActiveQuery = TRUE

						  elseif UseSavedQuery then
						    if IsObject( Session("Query") ) And IsObject( Session("RecordSet") ) then
						      set Q = Session("Query")
						      set RS = Session("RecordSet")

						      if RS.RecordCount > -1 and NextPageNumber <> -1 then
						        RS.AbsolutePage = NextPageNumber
						        NextRecordNumber = RS.AbsolutePosition
						      end if

						      ActiveQuery = TRUE
						    else
						      Response.Write "ERROR - No saved query"
						    end if
						  end if

						  if ActiveQuery then
						    if not RS.EOF then
						 %> <%
						        LastRecordOnPage = NextRecordNumber + RS.PageSize - 1
						        CurrentPage = RS.AbsolutePage
						        DocumentCount = "Documents "
						        if RS.RecordCount <> -1 AND RS.RecordCount < LastRecordOnPage then
						            LastRecordOnPage = RS.RecordCount
						        end if

						'        Response.Write "Documents " & NextRecordNumber & " to " & LastRecordOnPage
								DocumentCount = DocumentCount & NextRecordNumber & " to " & LastRecordOnPage
						        if RS.RecordCount <> -1 then
						'            Response.Write " of " & RS.RecordCount
								DocumentCount = DocumentCount & " of " & RS.RecordCount
						        end if
								DocumentCount = DocumentCount & " matching the query " & chr(34) & "<I>" & SearchString & "</I>" & chr(34) & "."
						'        Response.Write " matching the query " & chr(34) & "<I>"
						 '       Response.Write SearchString & "</I>" & chr(34) & ".<P>"
						 %> <% if Not RS.EOF and NextRecordNumber <= LastRecordOnPage then%> <table border=0 width=400>
                          <tr>
                            <td colspan=5 align=center class=SubHeading><%=DocumentCount%> <br> <br></td>
                          </tr>
                          <tr>
                            <% end if %>
                            <%SaveQuery = FALSE%>
                            <%if CurrentPage > 1 and RS.RecordCount >0 then %>
                            <td align=left> <form action="<%=QueryForm%>" method="get" id=form1 name=form1>
                                <INPUT TYPE="HIDDEN" NAME="qu" VALUE="<%=SearchString%>">
                                <INPUT TYPE="HIDDEN" NAME="FreeText" VALUE="<%=FreeText%>">
                                <INPUT TYPE="HIDDEN" NAME="sc" VALUE="<%=FormScope%>">
                                <INPUT TYPE="HIDDEN" name="pg" VALUE="<%=CurrentPage-1%>" >
                                <INPUT TYPE="HIDDEN" NAME = "RankBase" VALUE="<%=RankBase%>">
                                <input type="image" border="0" name="previous"  src="images/search/previous.gif" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('previous','','images/search/previous-over.gif',1)" Alt="Previous">
                              </form></td>
                            <%SaveQuery = TRUE%>
                            <%end if%>
                            <%
						'    This is the "next" button for unsorted queries.
						'    This retrieves the next page of documents for the query.

						  if Not RS.EOF then%>
                            <td colspan=4 align=right> <form action="<%=QueryForm%>" method="get" id=form2 name=form2>
                                <INPUT TYPE="HIDDEN" NAME="qu" VALUE="<%=SearchString%>">
                                <INPUT TYPE="HIDDEN" NAME="FreeText" VALUE="<%=FreeText%>">
                                <INPUT TYPE="HIDDEN" NAME="sc" VALUE="<%=FormScope%>">
                                <INPUT TYPE="HIDDEN" NAME = "RankBase" VALUE="<%=RankBase%>">
                                <INPUT TYPE="HIDDEN" name="pg" VALUE="<%=CurrentPage+1%>">
                                <% NextString = "Next "
						               if RS.RecordCount <> -1 then
						                   NextSet = (RS.RecordCount - NextRecordNumber) + 1
						                   if NextSet > RS.PageSize then
						                       DivSet = NextSet/RS.PageSize
						                       If DivSet > 2 Then
							                       NextSet = RS.PageSize
												else
													NextSet = NextSet - RS.PageSize
												End if
						                   end if
						                   NextString = NextString & NextSet & " documents"
						               else
						                   NextString = NextString & " page of documents"
						               end if
						            If DivSet > 1 Then
						             %>
                                <input type="image" border="0" name="next"  src="images/search/next.gif" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Next','','images/search/next-over.gif',1)" Alt="Next">
                                <%end if %>
                              </form></td>
                          </tr>
                        </table>
                        <%SaveQuery = TRUE%> <%end if%> <% if Not RS.EOF and NextRecordNumber <= LastRecordOnPage then%> <table border=0 width=400>
                          <% end if %>
                          <% Do While Not RS.EOF and NextRecordNumber <= LastRecordOnPage

						        ' This is the detail portion for Title, Abstract, URL, Size, and
						    ' Modification Date.

						    ' If there is a title, display it, otherwise display the filename.
						%>
                          <p>
                            <% ' Graphically indicate rank of document with list of stars (*'s).

							if NextRecordNumber = 1 then
								RankBase=RS("rank")
							end if

							if RankBase>1000 then
								RankBase=1000
							elseif RankBase<1 then
								RankBase=1
							end if

							NormRank = RS("rank")/RankBase

							if NormRank > 0.80 then
								stars = "images/search/rankbtn5.gif"
							elseif NormRank > 0.60 then
								stars = "images/search/rankbtn4.gif"
							elseif NormRank > 0.40 then
								stars = "images/search/rankbtn3.gif"
							elseif NormRank >.20 then
								stars = "images/search/rankbtn2.gif"
							else stars = "images/search/rankbtn1.gif"

							end if

						%>
                          <tr class="RecordTitle">
                            <td align="right" valign=top class="RecordTitle">
                              <%= NextRecordNumber%>. </td>
                            <td><b class="RecordTitle">
                              <%if Right(RS("vpath"),3) = "htm" or Right(RS("vpath"),4) = "html" Then %>
                              <%if VarType(RS("DocTitle")) = 1 or RS("DocTitle") = "" then%>
                              <a href="<%=RS("vpath")%>" class="RecordTitle"><%= Server.HTMLEncode( RS("filename") )%></a>
                              <%else%>
                              <a href="<%=RS("vpath")%>" class="RecordTitle"><%= Server.HTMLEncode(RS("DocTitle"))%></a>
                              <%end if%>
                              <%else%>
                              <%if VarType(RS("DocTitle")) = 1 or RS("DocTitle") = "" then%>
                              <a href="<%=RS("vpath")%>" class="RecordTitle" target="new"><%= Server.HTMLEncode( RS("filename") )%></a>
                              <%else%>
                              <a href="<%=RS("vpath")%>" class="RecordTitle" target="new"><%= Server.HTMLEncode(RS("DocTitle"))%></a>
                              <%end if%>
                              <%end if%>
                              </b></td>
                          </tr>
                          <tr colspan="3">
                            <td valign=top align=left> <IMG SRC="<%=stars%>">
                              <br> <%
									CiRestriction = Server.URLEncode( Q.Query )
									'CiRestriction = CiRestriction & " !#vpath *.xsl"
									CiRestriction = CiRestriction & " ((NOT #vpath *.xml) AND (NOT #vpath *.xsl) AND (NOT #vpath *.xls) AND (NOT #vpath *\_vti*)) "
									WebHitsQuery = "CiWebHitsFile=" & Server.URLEncode( RS("vpath") )
									WebHitsQuery = WebHitsQuery & "&CiRestriction=" & CiRestriction
									WebHitsQuery = WebHitsQuery & "&CiBeginHilite=" & Server.URLEncode( "<strong class=Hit>" )
									WebHitsQuery = WebHitsQuery & "&CiEndHilite=" & Server.URLEncode( "</strong>" )
									WebHitsQuery = WebHitsQuery & "&CiUserParam3=" & QueryForm
							%> </td>
                            <td valign=top colspan="3" align="left"> <%if VarType(RS("characterization")) = 8 and RS("characterization") <> "" then%> <b><i>Abstract: </I></b><%= Server.HTMLEncode(RS("characterization"))%> <%end if%> <p>
                                <%if Right(RS("vpath"),3) = "htm" or Right(RS("vpath"),4) = "html" Then %>
                                <!-- http://<%=Request("server_name")%><%=RS("vpath")%> --><i class="RecordStats">
                                <a href="<%=RS("vpath")%>" class="RecordStats" style="color:blue;">View</a>
                                <%else%>
                                <i class="RecordStats"><a href="<%=RS("vpath")%>" class="RecordStats" style="color:blue;" target="new">View</a>
                                <%end if%>
                                <br>
                                <%if RS("size") = "" then%>
                                (size and time unknown)
                                <%else%>
                                size <%=RS("size")%> bytes - <%=RS("write")%> GMT
                                <%end if%>
                                </i> </td>
                          </tr>
                          <%
						          RS.MoveNext
						          NextRecordNumber = NextRecordNumber+1
						      Loop
						 %>
                          <P><BR>
                            <%
						  else   ' NOT RS.EOF
						      if NextRecordNumber = 1 then %>
                          <table width=400>
                            <tr>
                              <td align=center class=SubHeading><BR>
                                No documents matched your search.<br></td>
                            </tr>
                            <%      else %>
                            <tr>
                              <td align=center class=SubHeading>No more documents
                                in the query<br></td>
                            </tr>
                            <%      end if

						  end if ' NOT RS.EOF


						if NOT Q.OutOfDate then
						' If the index is current, display the fact %>
                          </table>
                          <%end if


						  if Q.QueryIncomplete then
						'    If the query was not executed because it needed to enumerate to
						'    resolve the query instead of using the index, but AllowEnumeration
						'    was FALSE, let the user know %>
                          <P> <I><B>The query is too expensive to complete.</B></I><BR>
                            <%end if


						  if Q.QueryTimedOut then
						'    If the query took too long to execute (for example, if too much work
						'    was required to resolve the query), let the user know %>
                          <P> <I><B>The query took too long to complete.</B></I><BR>
                            <%end if%>
                        </table>
                        <TABLE width=400>
                          <%
						'    This is the "previous" button.
						'    This retrieves the previous page of documents for the query.
						%>
                          <%SaveQuery = FALSE%>
                          <%if CurrentPage > 1 and RS.RecordCount <> -1 then %>
                          <td align=left> <form action="<%=QueryForm%>" method="get" id=form3 name=form3>
                              <INPUT TYPE="HIDDEN" NAME="qu" VALUE="<%=SearchString%>">
                              <INPUT TYPE="HIDDEN" NAME="FreeText" VALUE="<%=FreeText%>">
                              <INPUT TYPE="HIDDEN" NAME="sc" VALUE="<%=FormScope%>">
                              <INPUT TYPE="HIDDEN" name="pg" VALUE="<%=CurrentPage-1%>" >
                              <INPUT TYPE="HIDDEN" NAME = "RankBase" VALUE="<%=RankBase%>">
                              <input type="image" border="0" name="Previous"  src="images/search/previous.gif" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Previous','','images/search/previous-over.gif',1)" Alt="Previous">
                            </form></td>
                          <%SaveQuery = TRUE%>
                          <%end if%>
                          <%
						'    This is the "next" button for unsorted queries.
						'    This retrieves the next page of documents for the query.

						  if Not RS.EOF then%>
                          <td align=right> <form action="<%=QueryForm%>" method="get" id=form4 name=form4>
                              <INPUT TYPE="HIDDEN" NAME="qu" VALUE="<%=SearchString%>">
                              <INPUT TYPE="HIDDEN" NAME="FreeText" VALUE="<%=FreeText%>">
                              <INPUT TYPE="HIDDEN" NAME="sc" VALUE="<%=FormScope%>">
                              <INPUT TYPE="HIDDEN" NAME = "RankBase" VALUE="<%=RankBase%>">
                              <INPUT TYPE="HIDDEN" name="pg" VALUE="<%=CurrentPage+1%>">
                              <% NextString = "Next "
						               if RS.RecordCount <> -1 then
						                   NextSet = (RS.RecordCount - NextRecordNumber) + 1
						                   if NextSet > RS.PageSize then
						                       NextSet = RS.PageSize
						                   end if
						                   NextString = NextString & NextSet & " documents"
						               else
						                   NextString = NextString & " page of documents"
						               end if
						             %>
                              <input type="image" border="0" name="Next"  src="images/search/next.gif" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Next','','images/search/next-over.gif',1)" Alt="Next">
                            </form></td>
                          <%SaveQuery = TRUE%>
                          <%end if%>
                          <% ' Display the page number %>
                          <%
						if CurrentPage > 0 then
							RunningPage = "Page " & CurrentPage
						end if
						%>
                          <%if RS.PageCount > 0 then
							  RunningPage = RunningPage & " of " & RS.PageCount %>
                          <tr>
                            <td align=Center colspan=4><b><%=RunningPage%></b></td>
                          </tr>
                          <%  end if %>
                          <%
						    ' If either of the previous or back buttons were displayed, save the query
						    ' and the recordset in session variables.
						    if SaveQuery then
						        set Session("Query") = Q
						        set Session("RecordSet") = RS
						    else
						        RS.close
						        Set RS = Nothing
						        Set Q = Nothing
						        set Session("Query") = Nothing
						        set Session("RecordSet") = Nothing
						    end if
						 %>
                          <% end if %>
                        </TABLE>
				</td>
              </tr>
            </table>
</body>
</html>
