﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALAanwezig
/// </summary>
public class DALAanwezig
{
    private CreativityEventDataContext dc = new CreativityEventDataContext();

    public void insert(Aanwezig p_ev)
    {

        dc.Aanwezigs.InsertOnSubmit(p_ev);
        dc.SubmitChanges();
    }

    public List<int> SelectEvent(int id)
    {
        var query = (from u in dc.Aanwezigs where u.EventId == id
                     select u.PersoonId).ToList();
        return query;

    }
}