﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLEvent
/// </summary>
public class BLLEvent
{
    DALEvent DalAddEvents = new DALEvent();

    public void insert(Event p_eve)
    {
        DalAddEvents.insert(p_eve);
    }

    public void aanwezig(int p_int)
    {
        DalAddEvents.aanwezig(p_int);
    }

    public List<Event> SelectAllEvents() 
    {
        return DalAddEvents.SelectAll();
    }
}