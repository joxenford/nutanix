@primaryFontName: GothamRounded-Light;
@secondaryFontName: GothamRounded-Light;
@secondaryFontNameBold: GothamRounded-Medium;
@inputFontName: GothamRounded-Light;
@primaryFontColor: #555555;
@secondaryFontColor: #888888;
@nutanixBlue: #034ea2;
@nutanixGreen: #b0d236;
@primaryBackgroundColor: #E6E6E6;
@primaryBackgroundTintColor: #ECECEC;
@primaryBackgroundColorTop: #F3F3F3;
@primaryBackgroundColorBottom: #E6E6E6;
@primaryBackgroundColorBottomStrong: #DDDDDD;
@secondaryBackgroundColorTop: #FCFCFC;
@secondaryBackgroundColorBottom: #F9F9F9;
@primaryBorderColor: #A2A2A2;
@primaryBorderWidth: 1;

BarButton {
background-color: @nutanixBlue;
background-color-highlighted:@nutanixBlue;
border-color: @primaryBorderColor;
border-width: @primaryBorderWidth;
corner-radius: 7;
font-name: @secondaryFontNameBold;
font-color: #FFFFFF;
font-color-disabled: @secondaryFontColor;
font-size: 13;
text-shadow-color: clear;
}
Button {
exclude-views: UIWebView;
exclude-subviews: UIWebView;
background-color-top: @nutanixBlue;
background-color-bottom: @nutanixBlue;
border-color: @nutanixBlue;
border-width: @primaryBorderWidth;
font-color: #FFFFFF;
font-color-highlighted: @secondaryFontColor;
font-name: @secondaryFontName;
font-size: 18;
height: 37;
corner-radius: 5;
exclude-views: UIAlertButton;
exclude-subviews: UITableViewCell,UITextField;
}
LargeButton {
height: 50;
font-size: 20;
corner-radius: 10;
}
SmallButton {
height: 24;
font-size: 14;
corner-radius: 5;
}
Label {
font-name: @secondaryFontName;
font-size: 18;
font-color: @primaryFontColor;
text-auto-fit: false;
}
LargeLabel {
font-name: @secondaryFontNameBold;
font-size: 24;
font-color: @primaryFontColor;
text-auto-fit: true;
}
SmallLabel {
font-name: @secondaryFontName;
font-size: 15;
font-color: @primaryFontColor;
text-auto-fit: false;
}
NavigationBar {
font-name: @secondaryFontName;
font-size: 20;
font-color: #FFFFFF;
text-shadow-color: clear;
background-color-top: @nutanixBlue;
background-color-bottom: @nutanixBlue;
}
Progress {
progress-tint-color: @primaryBackgroundTintColor;
track-tint-color: @secondaryBackgroundColorTop;
}
SearchBar {
background-color-top: @primaryBackgroundColorTop;
background-color-bottom: @primaryBackgroundColorBottom;
scope-background-color: #FFFFFF;
}
SegmentedControl {
background-color: @primaryBackgroundColorTop;
background-color-selected: @primaryBackgroundColorBottomStrong;
border-color: @primaryBorderColor;
border-width: @primaryBorderWidth;
corner-radius: 7;
font-name: @secondaryFontNameBold;
font-size: 13;
font-color: @primaryFontColor;
text-shadow-color: clear;
}
Switch {
on-tint-color: @primaryBackgroundTintColor;
}
TabBar {
background-color-top: @nutanixBlue;
background-color-bottom: @nutanixBlue;
}
TabBarItem {
font-name: @secondaryFontName;
font-color: #FFFFFF;
font-size: 18;
text-offset: 0,-11;
}
TableCell {
background-color-top: @secondaryBackgroundColorTop;
background-color-bottom: @secondaryBackgroundColorBottom;
font-color: @primaryFontColor;
font-name: @secondaryFontName;
font-size: 17;
}
TableCellDetail {
font-name: @secondaryFontName;
font-size: 14;
font-color: @secondaryFontColor;
}
TextField {
height: 37;
font-name: @inputFontName;
font-size: 18;
border-style: rounded;
vertical-align: center;
}
LargeTextField {
height: 50;
font-size: 28;
}
View {
background-color: #FFFFFF;
}