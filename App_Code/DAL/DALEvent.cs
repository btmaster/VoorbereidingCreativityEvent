﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALEvent
/// </summary>
public class DALEvent
{
    private CreativityEventDataContext dc = new CreativityEventDataContext();

    public void insert(Event p_ev)
    {

        dc.Events.InsertOnSubmit(p_ev);
        dc.SubmitChanges();
    }

    public void aanwezig(int p_int)
    {
        var record_to_update = (from e in dc.Events
                                where e.Id == p_int
                                select e).Single();
        record_to_update.visitors++;
        dc.SubmitChanges();
    }

    public List<Event> SelectAll()
    {
        var query = (from u in dc.Events
                     select u).ToList();
        return query;

    }
/*
    public void delete(int e_int)
    {
        var eventVerwijder = (from e in dc.Events
                   where e.Id == e_int
                   select e).Single();
        dc.Events.DeleteOnSubmit(eventVerwijder);
        dc.SubmitChanges();

    }*/
}