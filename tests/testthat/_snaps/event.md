# as.data.frame works for event

    Code
      as.data.frame(new("Event"))
    Output
        pairing_order team_home gymnast_home dvalue_home endvalue_home score_home
      1             1      <NA>         <NA>           0             0          0
      2             2      <NA>         <NA>           0             0          0
      3             3      <NA>         <NA>           0             0          0
      4             4      <NA>         <NA>           0             0          0
        team_guest gymnast_guest dvalue_guest endvalue_guest score_guest home_starts
      1       <NA>          <NA>            0              0           0        TRUE
      2       <NA>          <NA>            0              0           0        TRUE
      3       <NA>          <NA>            0              0           0       FALSE
      4       <NA>          <NA>            0              0           0       FALSE

# Creation of an event from two lists of routines works

    Code
      as.data.frame(event)
    Output
        pairing_order team_home gymnast_home dvalue_home endvalue_home score_home
      1             1      <NA>         <NA>           0             1          0
      2             2      <NA>         <NA>           0             2          0
      3             3      <NA>         <NA>           0             3          0
      4             4      <NA>         <NA>           0             4          0
        team_guest gymnast_guest dvalue_guest endvalue_guest score_guest home_starts
      1       <NA>          <NA>            0              5           5        TRUE
      2       <NA>          <NA>            0              6           5        TRUE
      3       <NA>          <NA>            0              7           5       FALSE
      4       <NA>          <NA>            0              8           5       FALSE

# Creation of event with only one pairing works

    Code
      as.data.frame(event)
    Output
        pairing_order team_home gymnast_home dvalue_home endvalue_home score_home
      1             1      <NA>         <NA>           0            10         10
      2             2      <NA>         <NA>           0             0          0
      3             3      <NA>         <NA>           0             0          0
      4             4      <NA>         <NA>           0             0          0
        team_guest gymnast_guest dvalue_guest endvalue_guest score_guest home_starts
      1       <NA>          <NA>            0              0           0       FALSE
      2       <NA>          <NA>            0              0           0       FALSE
      3       <NA>          <NA>            0              0           0        TRUE
      4       <NA>          <NA>            0              0           0        TRUE

# reordering of routines in an event works

    Code
      as.data.frame(g)
    Output
        pairing_order team_home gymnast_home dvalue_home endvalue_home score_home
      1             1      <NA>         <NA>           0             7          3
      2             2      <NA>         <NA>           0             5          0
      3             3      <NA>         <NA>           0             3          3
      4             4      <NA>         <NA>           0             1          0
        team_guest gymnast_guest dvalue_guest endvalue_guest score_guest home_starts
      1       <NA>          <NA>            0              6           0        TRUE
      2       <NA>          <NA>            0              8           5        TRUE
      3       <NA>          <NA>            0              2           0       FALSE
      4       <NA>          <NA>            0              4           5       FALSE

# sorting the pairings in an event works

    Code
      as.data.frame(sort(e))
    Output
        pairing_order team_home gymnast_home dvalue_home endvalue_home score_home
      1             1      <NA>         <NA>           0           1.0          0
      2             2      <NA>         <NA>           0           3.0          0
      3             3      <NA>         <NA>           0           4.0          4
      4             4      <NA>         <NA>           0          10.4         10
        team_guest gymnast_guest dvalue_guest endvalue_guest score_guest home_starts
      1       <NA>          <NA>            0            2.0           3        TRUE
      2       <NA>          <NA>            0            4.0           3        TRUE
      3       <NA>          <NA>            0            2.5           0       FALSE
      4       <NA>          <NA>            0            1.2           0       FALSE

