# as.data.frame works for event

    Code
      as.data.frame(new("Event"))
    Output
        order gymnast_home dvalue_home endvalue_home score_home gymnast_guest
      1     1         <NA>           0             0          0          <NA>
      2     2         <NA>           0             0          0          <NA>
      3     3         <NA>           0             0          0          <NA>
      4     4         <NA>           0             0          0          <NA>
        dvalue_guest endvalue_guest score_guest home_starts
      1            0              0           0        TRUE
      2            0              0           0        TRUE
      3            0              0           0       FALSE
      4            0              0           0       FALSE

# Creation of an event from two lists of routines works

    Code
      as.data.frame(event)
    Output
        order gymnast_home dvalue_home endvalue_home score_home gymnast_guest
      1     1         <NA>           0             1          0          <NA>
      2     2         <NA>           0             2          0          <NA>
      3     3         <NA>           0             3          0          <NA>
      4     4         <NA>           0             4          0          <NA>
        dvalue_guest endvalue_guest score_guest home_starts
      1            0              5           5        TRUE
      2            0              6           5        TRUE
      3            0              7           5       FALSE
      4            0              8           5       FALSE

# Creation of event with only one pairing works

    Code
      as.data.frame(event)
    Output
        order gymnast_home dvalue_home endvalue_home score_home gymnast_guest
      1     1         <NA>           0            10         10          <NA>
      2     2         <NA>           0             0          0          <NA>
      3     3         <NA>           0             0          0          <NA>
      4     4         <NA>           0             0          0          <NA>
        dvalue_guest endvalue_guest score_guest home_starts
      1            0              0           0       FALSE
      2            0              0           0       FALSE
      3            0              0           0        TRUE
      4            0              0           0        TRUE

# reordering of routines in an event works

    Code
      as.data.frame(g)
    Output
        order gymnast_home dvalue_home endvalue_home score_home gymnast_guest
      1     1         <NA>           0             7          3          <NA>
      2     2         <NA>           0             5          0          <NA>
      3     3         <NA>           0             3          3          <NA>
      4     4         <NA>           0             1          0          <NA>
        dvalue_guest endvalue_guest score_guest home_starts
      1            0              6           0        TRUE
      2            0              8           5        TRUE
      3            0              2           0       FALSE
      4            0              4           5       FALSE

# sorting the pairings in an event works

    Code
      as.data.frame(sort(e))
    Output
        order gymnast_home dvalue_home endvalue_home score_home gymnast_guest
      1     1         <NA>           0           1.0          0          <NA>
      2     2         <NA>           0           3.0          0          <NA>
      3     3         <NA>           0           4.0          4          <NA>
      4     4         <NA>           0          10.4         10          <NA>
        dvalue_guest endvalue_guest score_guest home_starts
      1            0            2.0           3        TRUE
      2            0            4.0           3        TRUE
      3            0            2.5           0       FALSE
      4            0            1.2           0       FALSE

