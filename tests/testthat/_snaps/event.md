# as.data.frame works for event

    Code
      as.data.frame(new("Event"))
    Output
        gymnast_home dvalue_home endvalue_home score_home gymnast_guest dvalue_guest
      1         <NA>           0             0          0          <NA>            0
      2         <NA>           0             0          0          <NA>            0
      3         <NA>           0             0          0          <NA>            0
      4         <NA>           0             0          0          <NA>            0
        endvalue_guest score_guest
      1              0           0
      2              0           0
      3              0           0
      4              0           0

# Creation of an event from two lists of routines works

    Code
      as.data.frame(event)
    Output
        gymnast_home dvalue_home endvalue_home score_home gymnast_guest dvalue_guest
      1         <NA>           0             1          0          <NA>            0
      2         <NA>           0             2          0          <NA>            0
      3         <NA>           0             3          0          <NA>            0
      4         <NA>           0             4          0          <NA>            0
        endvalue_guest score_guest
      1              5           5
      2              6           5
      3              7           5
      4              8           5

# reordering of routines in an event works

    Code
      as.data.frame(g)
    Output
        gymnast_home dvalue_home endvalue_home score_home gymnast_guest dvalue_guest
      1         <NA>           0             7          3          <NA>            0
      2         <NA>           0             5          0          <NA>            0
      3         <NA>           0             3          3          <NA>            0
      4         <NA>           0             1          0          <NA>            0
        endvalue_guest score_guest
      1              6           0
      2              8           5
      3              2           0
      4              4           5

# sorting the pairings in an event works

    Code
      as.data.frame(sort(e))
    Output
        gymnast_home dvalue_home endvalue_home score_home gymnast_guest dvalue_guest
      1         <NA>           0           4.0          4          <NA>            0
      2         <NA>           0           1.4          1          <NA>            0
      3         <NA>           0           1.0          0          <NA>            0
      4         <NA>           0           3.0          0          <NA>            0
        endvalue_guest score_guest
      1            2.5           0
      2            1.2           0
      3            2.0           3
      4            4.0           3

