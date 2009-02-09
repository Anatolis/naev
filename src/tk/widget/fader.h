/*
 * See Licensing and Copyright notice in naev.h
 */



#ifndef FADER_H
#  define FADER_H


#include "font.h"
#include "colour.h"


/**
 * @brief The fader widget data.
 */
typedef struct WidgetFaderData_{ /* WIDGET_FADER */
   double value; /**< Current value. */
   double min;   /**< Minimum value. */
   double max;   /**< Maximum value. */
   void (*fptr) (unsigned int,char*); /**< Modify callback - triggered on value change. */
} WidgetFaderData;


/* Required functions. */
void window_addFader( const unsigned int wid,
      const int x, const int y, /* position */
      const int w, const int h, /* size, if w > h fader is horizontal, else vertical */     
      char* name, const double min, const double max, /* name, minimum & maximum values */  
      const double def, /* default pos. */
      void (*call) (unsigned int,char*) ); /* function to called on value change */

/* Misc functions. */
void window_faderValue( const unsigned int wid,
      char* name, double value );
void window_faderBounds( const unsigned int wid,
      char* name, double min, double max );
double window_getFaderValue( const unsigned int wid, char* name );


#endif /* FADER_H */

