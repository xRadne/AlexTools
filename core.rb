=begin
(c) 2018, Alexander Radne

Permission to use, copy, modify, and distribute this software for
any purpose and without fee is hereby granted, provided the above
copyright notice appear in all copies.

THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

== Information
Author:: Alexander Radne 
Name:: ToolOne
Version:: 1.0.0
SU Version:: 2018
Date:: 2018-03-26
Description:: Split faces up into triangles.
=end

module XRADNE_Extensions

	module XRADNE_Tool
		require 'sketchup.rb'
		require 'xRadneTools/loader.rb'
	end

	if !file_loaded?('xradne_menu_loader')
		@@xradne_tools_menu = UI.menu("Plugins").add_submenu("xRadne Tools")
	end

	#------New menu Items---------------------------
	if !file_loaded?('xradne_web_loader')
		@@xradne_web_menu = @@xradne_tools_menu.add_submenu("Websites")
		@@xradne_web_menu.add_item("xRadne @ GitHub"){UI.openURL('http://https://github.com/xRadne')}
		@@xradne_tools_menu.add_separator
	end
	#------------------------------------------------
	if !file_loaded?(__FILE__) then
		@@xradne_tools_menu.add_item('ToolOne'){
		    Sketchup.active_model.select_tool XRADNE_Extensions::XRADNE_Tool::ToolOne.new
		}
		# Add toolbar
		xradnetools_tb = UI::Toolbar.new "xRadne Tools"
		xradnetools_cmd = UI::Command.new("ToolOne"){
		    Sketchup.active_model.select_tool XRADNE_Extensions::XRADNE_Tool::ToolOne.new
		}
		xradnetools_cmd.small_icon = "img/x_small.png"
		xradnetools_cmd.large_icon = "img/x_large.png"
		xradnetools_cmd.tooltip = "ToolOne"
		xradnetools_cmd.status_bar_text = "Splits up faces"
		xradnetools_cmd.menu_text = "ToolOne"
		xradnetools_tb = xradnetools_tb.add_item xradnetools_cmd
		xradnetools_tb.show
	end

	file_loaded('xradne_web_loader')
	file_loaded('xradne_menu_loader')
	file_loaded(__FILE__)
end