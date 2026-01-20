routine <- S7::new_class(
	"routine",
	properties = list(
		gymnast = S7::class_character,
		d_value = S7::class_numeric,
		end_value = S7::class_numeric
	)
)
