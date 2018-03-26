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

	if !file_loaded?('rnd_menu_loader')
		@@alex_tools_menu = UI.menu("Plugins").add_submenu("xRadne Tools")
	end

	#------New menu Items---------------------------
	if !file_loaded?('rnd_ew_loader')
		@@rnd_ew_menu = @@alex_tools_menu.add_submenu("Websites")
		@@rnd_ew_menu.add_item("xRadne @ GitHub"){UI.openURL('http://https://github.com/xRadne')}
		@@alex_tools_menu.add_separator
	end
	#------------------------------------------------
	if !file_loaded?(__FILE__) then
		@@alex_tools_menu.add_item('ToolOne'){
		    Sketchup.active_model.select_tool XRADNE_Extensions::XRADNE_Tool::ToolOne.new
		}
		# Add toolbar
		alextools_tb = UI::Toolbar.new "ToolOne"
		alextools_cmd = UI::Command.new("ToolOne"){
		    Sketchup.active_model.select_tool XRADNE_Extensions::XRADNE_Tool::ToolOne.new
		}
		alextools_cmd.small_icon = "img/x_small.png"
		alextools_cmd.large_icon = "img/x_large.png"
		alextools_cmd.tooltip = "AlexTool"
		alextools_cmd.status_bar_text = "Splits up faces"
		alextools_cmd.menu_text = "AlexTool"
		alextools_tb = alextools_tb.add_item alextools_cmd
		alextools_tb.show
	end

	file_loaded('rnd_ew_loader')
	file_loaded('rnd_menu_loader')
	file_loaded(__FILE__)
end