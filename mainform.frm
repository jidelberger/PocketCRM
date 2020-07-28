object Form1: TForm1
  Left = 950
  Height = 674
  Top = 99
  Width = 927
  Caption = 'Merdeka Worlds CRM'
  ClientHeight = 674
  ClientWidth = 927
  Menu = MainMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  Position = poDesktopCenter
  LCLVersion = '7.2'
  object Panel1: TPanel
    Left = 0
    Height = 50
    Top = 0
    Width = 929
    Anchors = [akTop, akLeft, akRight]
    BevelOuter = bvNone
    ClientHeight = 50
    ClientWidth = 929
    Color = clMoneyGreen
    ParentColor = False
    TabOrder = 0
    object LblTitel: TLabel
      Left = 144
      Height = 29
      Top = 8
      Width = 70
      Caption = 'Home'
      Font.CharSet = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Century Gothic'
      ParentColor = False
      ParentFont = False
    end
  end
  object Panel2: TPanel
    AnchorSideTop.Control = Panel1
    AnchorSideTop.Side = asrBottom
    Left = 0
    Height = 626
    Top = 50
    Width = 138
    Anchors = [akTop, akLeft, akBottom]
    BevelOuter = bvNone
    ClientHeight = 626
    ClientWidth = 138
    Color = clMaroon
    ParentColor = False
    TabOrder = 1
    object cySpeedButton1: TcySpeedButton
      Left = 16
      Height = 46
      Top = 24
      Width = 112
      Caption = 'Start'
      Flat = True
      Font.CharSet = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Century Gothic'
      OnClick = cySpeedButton1Click
      ParentFont = False
      MonochromeGlyphColor = clBlack
      Degrade.FromColor = clYellow
      Degrade.SpeedPercent = 90
      Degrade.ToColor = 33023
      Wallpaper.Picture.Data = {
        1754506F727461626C654E6574776F726B47726170686963CA01000089504E47
        0D0A1A0A0000000D49484452000000170000001608060000002B760705000000
        017352474200AECE1CE9000000097048597300000B1300000B1301009A9C1800
        00016F494441543811ED953D2F05411486272849241A12716F2122510815211A
        A1946849D4129DC44741E30FF8151A954694D4340A958F822890F8284888CFE7
        BD7637E76E66EF9D5DAD3779B26766DE73F6EEEC99BDCE856B05EB46B83DDCB9
        80F53B62393CADBE730ECB179CC209E826F3F0674D53E103AEA00B3AE01C3E61
        160A6B92CC37B8851E53A54C7C0DEF3005B93542C60B3C42BF27BB97B93B7885
        71CF7AE6D4002B4FF00C43992EE7AC6FB8862F59CAFB8BEA3D6152B84C54642F
        27C8F3BD9BA4B0BAE002D40533C96C7860BBAA64D3DA18C4FD7B641772C607F8
        7506CEA01D5C136C431FA8B5B468D5C960D54E987893584F1B4BB93A13DDB003
        9566182358876338042B7584927C8C5A23F13EE8802D81CE48956A155FC3598A
        58E4AA9B651567E957DA96103D60BA8C8CF72109F234841A8BF8FE8B7B772DFD
        421B71B51A678B89D36173CA9BAE553944366990813EB321DAF398ECA1AA2ABE
        8B599F019FF417174B05B6E241EA7A63C73FE7745236EC4AA6B8000000004945
        4E44AE426082
      }
      Wallpaper.Position = bgCenterLeft
      Wallpaper.Style = bgNormal
      Wallpaper.Transparent = False
    end
    object cySpeedButton2: TcySpeedButton
      Left = 16
      Height = 46
      Top = 70
      Width = 112
      Caption = 'Kontakte'
      Flat = True
      Font.CharSet = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Century Gothic'
      OnClick = cySpeedButton2Click
      ParentFont = False
      MonochromeGlyphColor = clBlack
      Degrade.FromColor = clYellow
      Degrade.SpeedPercent = 90
      Degrade.ToColor = 33023
      Wallpaper.Picture.Data = {
        1754506F727461626C654E6574776F726B477261706869636801000089504E47
        0D0A1A0A0000000D49484452000000150000001808060000001589B648000000
        017352474200AECE1CE9000000097048597300000B1300000B1301009A9C1800
        00010D494441543811B594411201410C458DB2B4B1B752E5306EE1060EA6EC58
        B91385951579D11991EA1933F4FCAAE8E4E7F7AF7437AAD10B8FB41659C6455C
        82C924D455A8FB967AE241261DCCB4E823715F5D265D8A6E277195B8A41CEE67
        B0F924C1697CC0E58C4D23EDF7062DDC071322DC4BCC531C12472FA293294746
        88A1811C8EAB885053EE94A4096DBDA63DCAABBB6439836DE273C7A717615E91
        FFA81752DD244C6C2B1CBD08EDDB57CAC451B416621AC9C4D16B45CE74253BE0
        EF121B89590A72387A683C6A1F4B583D8E52C0611201470F8D877969B32E9CE2
        2C393C1346C0D143E3A13EFFFED57943724C3BFDF6D1F5C2B7D7EF65666233B5
        BAC83A88A93D945E709131C56490499FB6DF5677A11A99160000000049454E44
        AE426082
      }
      Wallpaper.Position = bgCenterLeft
      Wallpaper.Style = bgNormal
      Wallpaper.Transparent = False
    end
    object Indikator: TPanel
      Left = 0
      Height = 46
      Top = 24
      Width = 7
      Color = clMoneyGreen
      ParentColor = False
      TabOrder = 0
    end
  end
  object HomePanel: TPanel
    AnchorSideLeft.Control = Panel2
    AnchorSideLeft.Side = asrBottom
    AnchorSideTop.Control = Panel1
    AnchorSideTop.Side = asrBottom
    Left = 138
    Height = 2006
    Top = 50
    Width = 914
    Anchors = [akTop, akLeft, akRight, akBottom]
    BevelOuter = bvNone
    Color = clCream
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object ContactsPanel: TPanel
    AnchorSideLeft.Control = Panel2
    AnchorSideLeft.Side = asrBottom
    AnchorSideTop.Control = Panel1
    AnchorSideTop.Side = asrBottom
    Left = 138
    Height = 1956
    Top = 50
    Width = 776
    Anchors = [akTop, akLeft, akRight, akBottom]
    BevelOuter = bvNone
    ClientHeight = 1956
    ClientWidth = 776
    Color = clCream
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object cyLabel1: TcyLabel
      Left = 40
      Height = 17
      Top = 37
      Width = 65
      AutoSize = False
      Caption = 'Kontakt-ID:'
      Transparent = False
      Bevels = <>
      Degrade.FromColor = clCream
      Degrade.SpeedPercent = 100
      Degrade.ToColor = clCream
    end
    object cyLabel2: TcyLabel
      Left = 40
      Height = 17
      Top = 96
      Width = 65
      AutoSize = False
      Caption = 'Vorname: '
      Transparent = False
      Bevels = <>
      Degrade.FromColor = clCream
      Degrade.SpeedPercent = 100
      Degrade.ToColor = clCream
    end
    object EdtVorname: TcyEdit
      Left = 128
      Height = 22
      Top = 94
      Width = 208
      OnChange = EdtVornameChange
      TabOrder = 1
      CharRules = <>
    end
    object cyLabel3: TcyLabel
      Left = 408
      Height = 17
      Top = 98
      Width = 65
      AutoSize = False
      Caption = 'Name:'
      Transparent = False
      Bevels = <>
      Degrade.FromColor = clCream
      Degrade.SpeedPercent = 100
      Degrade.ToColor = clCream
    end
    object EdtName: TcyEdit
      Left = 496
      Height = 22
      Top = 96
      Width = 208
      OnChange = EdtNameChange
      TabOrder = 2
      CharRules = <>
    end
    object cyLabel4: TcyLabel
      Left = 40
      Height = 17
      Top = 138
      Width = 146
      AutoSize = False
      Caption = 'Adresse:'
      Transparent = False
      Bevels = <>
      Degrade.FromColor = clCream
      Degrade.SpeedPercent = 100
      Degrade.ToColor = clCream
    end
    object EdtAdresse: TcyEdit
      Left = 128
      Height = 22
      Top = 136
      Width = 576
      OnChange = EdtAdresseChange
      TabOrder = 3
      CharRules = <>
    end
    object cyLabel5: TcyLabel
      Left = 40
      Height = 17
      Top = 181
      Width = 81
      AutoSize = False
      Caption = 'Postleitzahl:'
      Transparent = False
      Bevels = <>
      Degrade.FromColor = clCream
      Degrade.SpeedPercent = 100
      Degrade.ToColor = clCream
    end
    object EdtPLZ: TcyEdit
      Left = 128
      Height = 22
      Top = 176
      Width = 104
      OnChange = EdtPLZChange
      TabOrder = 4
      CharRules = <>
    end
    object cyLabel6: TcyLabel
      Left = 264
      Height = 17
      Top = 181
      Width = 81
      AutoSize = False
      Caption = 'Ort:'
      Transparent = False
      Bevels = <>
      Degrade.FromColor = clCream
      Degrade.SpeedPercent = 100
      Degrade.ToColor = clCream
    end
    object EdtOrt: TcyEdit
      Left = 304
      Height = 22
      Top = 176
      Width = 400
      OnChange = EdtOrtChange
      TabOrder = 5
      CharRules = <>
    end
    object plLine1: TplLine
      Left = 40
      Height = 12
      Top = 241
      Width = 664
      ButtonSize = 4
      Color = clWhite
      ColorShadow = clWhite
      CanFocus = True
      Focused = False
      ShadowSize = -2
      UseHitTest = True
      Arrow1 = False
      Arrow2 = False
      ButtonCount = 2
      ArrowSize = 5
      ArrowFill = True
      BinaryBtnData = {
        06000000060000009202000006000000
      }
    end
    object cyLabel7: TcyLabel
      Left = 40
      Height = 17
      Top = 272
      Width = 81
      AutoSize = False
      Caption = 'Telefon:'
      Transparent = False
      Bevels = <>
      Degrade.FromColor = clCream
      Degrade.SpeedPercent = 100
      Degrade.ToColor = clCream
    end
    object EdtPhone: TcyEdit
      Left = 128
      Height = 22
      Top = 267
      Width = 576
      OnChange = EdtPhoneChange
      TabOrder = 6
      CharRules = <>
    end
    object cyLabel8: TcyLabel
      Left = 40
      Height = 17
      Top = 304
      Width = 81
      AutoSize = False
      Caption = 'E-Mail:'
      Transparent = False
      Bevels = <>
      Degrade.FromColor = clCream
      Degrade.SpeedPercent = 100
      Degrade.ToColor = clCream
    end
    object EdtMail: TcyEdit
      Left = 128
      Height = 22
      Top = 299
      Width = 576
      OnChange = EdtMailChange
      TabOrder = 7
      CharRules = <>
    end
    object BtnCreateContact: TcySpeedButton
      Left = 216
      Height = 30
      Top = 24
      Width = 31
      Flat = True
      OnClick = BtnCreateContactClick
      MonochromeGlyphColor = clBlack
      Degrade.FromColor = clYellow
      Degrade.SpeedPercent = 90
      Degrade.ToColor = 33023
      Wallpaper.Picture.Data = {
        1754506F727461626C654E6574776F726B47726170686963A102000089504E47
        0D0A1A0A0000000D494844520000001A0000001A0806000000A94A4CCE000000
        017352474200AECE1CE9000000097048597300000B1300000B1301009A9C1800
        00024649444154480DBD962F4F034110C5AF84A00821414048EA5188FA6B6A50
        E02AC0F011C0A21B824315BE06028729882A2455F826380C24140CF07EC74ED3
        6EE76E9B0A5EF2CADECCDB3777FB975A96C6AE246D311777C40D11BC8ACF625F
        BC1107E242C018939F3989963E736359CAAE680578F36BF140AC8B2B81B48991
        43637AFAE2518975657B229D3EC40B714D4C010DDA91485F3CF072C15B5891A1
        DA0D57551DA40F7DAD98FB65574180705B8CB1AFC0BDF82EBE8536B118F4B562
        0CE3149A7AB2E1F2BEE43CE4D1C42417030F1BC67C32D9D703068C730CDE9ADC
        A7782232F690363172DE97E1450EEF02EC1302AC1C6FE2192EF218C73855801C
        9A1878E1499E1A59273CB04C3D302788BD55448C1C73E6014FF29D25FDD818DE
        794AC5BE4BE2846B21879907F3CC29C4B1029EFEFECCFC3E86C8F14C26CB2C66
        9A58629E458D2F65792376BC873D05C9572D06341EF0A42F358A9FAA42682E45
        341EC99561AAD08B5418D44BD4478A33D95E1162E40E450F78A2A146F6101E38
        206360C062407C2BB6C4D540DAC4C8A1F18AE149BE58FE65CB7B4B02FB9233B5
        CB400E33B49B9168BCBC89B39910C61BD676366F9D827D197D0C331B96847704
        0D14E7055A620A2D09D0D2C7602F3A3E824834458423B12102DAC4989314D0A0
        E50E037858FFBC884CFC74D5463C14BD6B62425AD9ACBC26E8F96F171FC53824
        7BA20D03E3CCA4A68006AD0D171EDE213CE5C397D96D4B415623CB943DC10664
        B743DAC4C8D975809E2970AF70C55DE48ADA6AC42045B4F47161C7BC9B0C41F6
        595BC464E17F207F01DD8AD8CBCC2D08640000000049454E44AE426082
      }
      Wallpaper.Position = bgCentered
      Wallpaper.Style = bgNormal
      Wallpaper.Transparent = False
    end
    object BtnContactEdit: TcySpeedButton
      Left = 256
      Height = 30
      Top = 24
      Width = 32
      Flat = True
      OnClick = BtnContactEditClick
      MonochromeGlyphColor = clBlack
      Degrade.FromColor = clYellow
      Degrade.SpeedPercent = 90
      Degrade.ToColor = 33023
      Wallpaper.Picture.Data = {
        1754506F727461626C654E6574776F726B477261706869635302000089504E47
        0D0A1A0A0000000D494844520000001A0000001B080600000062169F6B000000
        017352474200AECE1CE9000000097048597300000B1300000B1301009A9C1800
        0001F849444154480DAD95BB4A4341144583285A285808DAF803412B05DBF801
        2221F811562216A6562B0BC1AFB00EA2F80D165A58F9405B1FA80441107CED95
        CCC4C924337772CD869D799C7DCECE3D33372914C29850684B3C17DF0C99B347
        AC2F28AB4A5DFC0990189A7F8102DF222635B1248E1A32678F189ADC66B4A46E
        0A6D6A0C8118666873B591FEDB27D1340AFB64E4F40C0E1BA35242261AB4E4F4
        0C6E17C99C4916D0A0252713039E62D05BA72C93727CA36B53793EC1C16A6C4E
        34C5373A34EAF56856336835362721E54F32A5E9B348EF63D7BB6A3468C97131
        ACC5BEF86AC89CBD0E94B5F3256256134B62B717160D5A17235A9C88E4BAC4AC
        2B2ADAB5BF0E6E829D1343E3C235795480335C10C979113BB0A49D1BD1160D8D
        97D2A005BEC96C73BB30A7B1ABD1AE0910BC10D7C4A248EBC6C4197143BC12ED
        1720C7B68B27B1268C4F46D7D63A6BF2A1E0AAE8DF486DB5C0BBC365F914ADA1
        6FC29A185FA2751996CD26268B620A68D7A948B19809BA0686F4792792C093A4
        207426B4CB7D9296094557444C389358BB146E209709990722461C7C16729B50
        F856C4A8C822020E3474BB82ED72EBBD6B81115738868A82E8920E3E56282BB6
        638CB68D307AF059C562F16363B4A711B3A476C50A8662F70AD03A979C59DB15
        0E2527FD3B2A795A9C141FC43387479AF392F70DE3AA84596EFC0293A2B658FC
        05E1320000000049454E44AE426082
      }
      Wallpaper.Position = bgCentered
      Wallpaper.Style = bgNormal
      Wallpaper.Transparent = False
    end
    object plLine2: TplLine
      Left = 40
      Height = 12
      Top = 336
      Width = 664
      ButtonSize = 4
      Color = clWhite
      ColorShadow = clWhite
      CanFocus = True
      Focused = False
      ShadowSize = -2
      UseHitTest = True
      Arrow1 = False
      Arrow2 = False
      ButtonCount = 2
      ArrowSize = 5
      ArrowFill = True
      BinaryBtnData = {
        06000000060000009202000006000000
      }
    end
    object CbGroup: TcyCombobox
      Left = 136
      Height = 20
      Top = 376
      Width = 100
      ItemHeight = 19
      OnSelect = CbGroupSelect
      TabOrder = 8
    end
    object cyLabel9: TcyLabel
      Left = 40
      Height = 17
      Top = 376
      Width = 81
      AutoSize = False
      Caption = 'Gruppe:'
      Transparent = False
      Bevels = <>
      Degrade.FromColor = clCream
      Degrade.SpeedPercent = 100
      Degrade.ToColor = clCream
    end
    object BtnCreateGroup: TcySpeedButton
      Left = 264
      Height = 30
      Top = 371
      Width = 31
      Flat = True
      OnClick = BtnCreateGroupClick
      MonochromeGlyphColor = clBlack
      Degrade.FromColor = clYellow
      Degrade.SpeedPercent = 90
      Degrade.ToColor = 33023
      Wallpaper.Picture.Data = {
        1754506F727461626C654E6574776F726B47726170686963A100000089504E47
        0D0A1A0A0000000D4948445200000016000000160806000000C4B46C3B000000
        017352474200AECE1CE9000000097048597300000B1300000B1301009A9C1800
        0000464944415438116360201EFC072A0561A2001351AAC850346A303CD04683
        6208070523D0ED44E726B83F8960D02C551061375CC96859010F0A9218348BBC
        5183E1F130F482020034FA05231AE315A70000000049454E44AE426082
      }
      Wallpaper.Position = bgCentered
      Wallpaper.Style = bgNormal
      Wallpaper.Transparent = False
    end
    object BtnDeleteGroup: TcySpeedButton
      Left = 305
      Height = 30
      Top = 371
      Width = 31
      Flat = True
      OnClick = BtnDeleteGroupClick
      MonochromeGlyphColor = clBlack
      Degrade.FromColor = clYellow
      Degrade.SpeedPercent = 90
      Degrade.ToColor = 33023
      Wallpaper.Picture.Data = {
        1754506F727461626C654E6574776F726B477261706869637100000089504E47
        0D0A1A0A0000000D49484452000000160000000208060000005CF32CB6000000
        017352474200AECE1CE9000000097048597300000B1300000B1301009A9C1800
        00001649444154081D63646060F80FC454074C5437116A2000AF680103590BD8
        EB0000000049454E44AE426082
      }
      Wallpaper.Position = bgCentered
      Wallpaper.Style = bgNormal
      Wallpaper.Transparent = False
    end
    object EdtID: TcyEdit
      Left = 120
      Height = 22
      Top = 32
      Width = 88
      OnChange = EdtIDChange
      TabOrder = 0
      CharRules = <>
    end
    object BtnSaveContact: TcySpeedButton
      Left = 672
      Height = 30
      Top = 371
      Width = 31
      Enabled = False
      Flat = True
      OnClick = BtnSaveContactClick
      MonochromeGlyphColor = clGray
      Degrade.FromColor = clYellow
      Degrade.SpeedPercent = 90
      Degrade.ToColor = 33023
      Wallpaper.Picture.Data = {
        1754506F727461626C654E6574776F726B477261706869630201000089504E47
        0D0A1A0A0000000D4948445200000016000000160806000000C4B46C3B000000
        017352474200AECE1CE9000000097048597300000B1300000B1301009A9C1800
        0000A7494441543811ED92010A803008452D3A44F73F541DA7F6A31FBAB96031
        832061E4BEFA726E22225B87B524C69C96B11E6030D6B40C9C60FD374F433CD7
        B90714BE813388429AA72196EBDCA3D302CE20A11E40C7B4AF6B351C332FBAA8
        691A485F83A1017E68C3E940844F43B0C58ADAB1A5BA2577AA24EB0E2A29F772
        58C761606F14AD17C79998F1BDDAB1DB0145E7EB9E30ACE31F7C5DC1F7468147
        ED3E97EB4C0F9DB051EC4D7C513E4135F4D10000000049454E44AE426082
      }
      Wallpaper.Position = bgCentered
      Wallpaper.Style = bgNormal
      Wallpaper.Transparent = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 872
    Top = 8
    object MenuItem1: TMenuItem
      Caption = 'Datei'
      object MenuItem2: TMenuItem
        Caption = 'Beenden'
        ShortCut = 4177
        OnClick = MenuItem2Click
      end
    end
    object MenuItem3: TMenuItem
      Caption = 'Bearbeiten'
    end
    object MenuItem4: TMenuItem
      Caption = 'Springen'
      object MenuItem5: TMenuItem
        Caption = 'Start'
        ShortCut = 4168
        OnClick = MenuItem5Click
      end
      object MenuItem6: TMenuItem
        Caption = 'Kontakte'
        ShortCut = 4145
        OnClick = MenuItem6Click
      end
    end
  end
end
