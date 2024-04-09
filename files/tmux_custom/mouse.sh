show_mouse() {
	local index=$1
	local icon="$(get_tmux_option "@catppuccin_test_icon" "󰍽")"
	local color="$(get_tmux_option "@catppuccin_test_color" "$thm_green")"

	local module="$( build_status_module "$index" "$icon" "$color" "#( tmux show -gw mouse | sed -e 's/mouse //g' | tr "[o]" "[O]" )" )"

	echo "$module"
}
