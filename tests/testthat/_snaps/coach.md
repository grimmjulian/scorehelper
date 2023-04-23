# reordering of routines in an event works

    Code
      g
    Output
      An object of class "Event"
      Slot "first":
      An object of class "Pairing"
      Slot "home":
      An object of class "Routine"
      Slot "gymnast":
      An object of class "Gymnast"
      Slot "id":
      [1] NA
      
      Slot "name":
      [1] NA
      
      Slot "birthday":
      [1] NA
      
      Slot "nationality":
      [1] NA
      
      
      Slot "dvalue":
      [1] 0
      
      Slot "endvalue":
      [1] 7
      
      
      Slot "guest":
      An object of class "Routine"
      Slot "gymnast":
      An object of class "Gymnast"
      Slot "id":
      [1] NA
      
      Slot "name":
      [1] NA
      
      Slot "birthday":
      [1] NA
      
      Slot "nationality":
      [1] NA
      
      
      Slot "dvalue":
      [1] 0
      
      Slot "endvalue":
      [1] 6
      
      
      Slot "home_starts":
      [1] TRUE
      
      
      Slot "second":
      An object of class "Pairing"
      Slot "home":
      An object of class "Routine"
      Slot "gymnast":
      An object of class "Gymnast"
      Slot "id":
      [1] NA
      
      Slot "name":
      [1] NA
      
      Slot "birthday":
      [1] NA
      
      Slot "nationality":
      [1] NA
      
      
      Slot "dvalue":
      [1] 0
      
      Slot "endvalue":
      [1] 5
      
      
      Slot "guest":
      An object of class "Routine"
      Slot "gymnast":
      An object of class "Gymnast"
      Slot "id":
      [1] NA
      
      Slot "name":
      [1] NA
      
      Slot "birthday":
      [1] NA
      
      Slot "nationality":
      [1] NA
      
      
      Slot "dvalue":
      [1] 0
      
      Slot "endvalue":
      [1] 8
      
      
      Slot "home_starts":
      [1] TRUE
      
      
      Slot "third":
      An object of class "Pairing"
      Slot "home":
      An object of class "Routine"
      Slot "gymnast":
      An object of class "Gymnast"
      Slot "id":
      [1] NA
      
      Slot "name":
      [1] NA
      
      Slot "birthday":
      [1] NA
      
      Slot "nationality":
      [1] NA
      
      
      Slot "dvalue":
      [1] 0
      
      Slot "endvalue":
      [1] 3
      
      
      Slot "guest":
      An object of class "Routine"
      Slot "gymnast":
      An object of class "Gymnast"
      Slot "id":
      [1] NA
      
      Slot "name":
      [1] NA
      
      Slot "birthday":
      [1] NA
      
      Slot "nationality":
      [1] NA
      
      
      Slot "dvalue":
      [1] 0
      
      Slot "endvalue":
      [1] 2
      
      
      Slot "home_starts":
      [1] FALSE
      
      
      Slot "fourth":
      An object of class "Pairing"
      Slot "home":
      An object of class "Routine"
      Slot "gymnast":
      An object of class "Gymnast"
      Slot "id":
      [1] NA
      
      Slot "name":
      [1] NA
      
      Slot "birthday":
      [1] NA
      
      Slot "nationality":
      [1] NA
      
      
      Slot "dvalue":
      [1] 0
      
      Slot "endvalue":
      [1] 1
      
      
      Slot "guest":
      An object of class "Routine"
      Slot "gymnast":
      An object of class "Gymnast"
      Slot "id":
      [1] NA
      
      Slot "name":
      [1] NA
      
      Slot "birthday":
      [1] NA
      
      Slot "nationality":
      [1] NA
      
      
      Slot "dvalue":
      [1] 0
      
      Slot "endvalue":
      [1] 4
      
      
      Slot "home_starts":
      [1] FALSE
      
      

---

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

