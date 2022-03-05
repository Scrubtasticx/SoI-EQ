#include "../common/features.h"

#ifdef EMBPERL_XS_CLASSES

#include "../common/global_define.h"
#include <list>
#include "embperl.h"

#ifdef seed
#undef seed
#endif

#include "entity.h"

#ifdef THIS /* this macro seems to leak out on some systems */
#undef THIS
#endif

#define VALIDATE_THIS_IS_ENTITY \
	do { \
		if (sv_derived_from(ST(0), "EntityList")) { \
			IV tmp = SvIV((SV*)SvRV(ST(0))); \
			THIS = INT2PTR(EntityList*, tmp); \
		} else { \
			Perl_croak(aTHX_ "THIS is not of type EntityList"); \
		} \
		if (THIS == nullptr) { \
			Perl_croak(aTHX_ "THIS is nullptr, avoiding crash."); \
		} \
	} while (0);

XS(XS_EntityList_GetMobID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetMobID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetMobID(THIS, id)"); // @categories Script Utility
	{
		EntityList *THIS;
		Mob        *RETVAL;
		uint16     id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetMobID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Mob", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetMob); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetMob) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetMob(THIS, name)");
	{
		EntityList *THIS;
		Mob        *RETVAL;
		char       *name = (char *) SvPV_nolen(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetMob(name);
		ST(0)            = sv_newmortal();
		sv_setref_pv(ST(0), "Mob", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetMobByID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetMobByID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetMobByID(THIS, id)"); // @categories Script Utility
	{
		EntityList *THIS;
		Mob        *RETVAL;
		uint16     id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetMob(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Mob", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetMobByNpcTypeID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetMobByNpcTypeID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetMobByNpcTypeID(THIS, get_id)"); // @categories Script Utility
	{
		EntityList *THIS;
		Mob        *RETVAL;
		uint32     get_id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetMobByNpcTypeID(get_id);
		ST(0)             = sv_newmortal();
		sv_setref_pv(ST(0), "Mob", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_IsMobSpawnedByNpcTypeID); /* prototype pass -Wmissing-prototypes */
XS(XS_EntityList_IsMobSpawnedByNpcTypeID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::IsMobSpawnedByNpcTypeID(THIS, get_id)"); // @categories Script Utility
	{
		EntityList *THIS;
		bool       RETVAL;
		uint32     get_id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->IsMobSpawnedByNpcTypeID(get_id);
		ST(0)             = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetNPCByID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetNPCByID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetNPCByID(THIS, id)"); // @categories Script Utility
	{
		EntityList *THIS;
		NPC        *RETVAL;
		uint16     id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetNPCByID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "NPC", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetNPCByNPCTypeID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetNPCByNPCTypeID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetNPCByNPCTypeID(THIS, npc_id)"); // @categories Script Utility
	{
		EntityList *THIS;
		NPC        *RETVAL;
		uint32     npc_id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetNPCByNPCTypeID(npc_id);
		ST(0)             = sv_newmortal();
		sv_setref_pv(ST(0), "NPC", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetNPCBySpawnID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetNPCBySpawnID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetNPCBySpawnID(THIS, spawn_id)"); // @categories Script Utility, Spawns
	{
		EntityList *THIS;
		NPC 	   *RETVAL;
		uint32	   spawn_id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetNPCBySpawnID(spawn_id);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "NPC", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetClientByName); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetClientByName) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetClientByName(THIS, name)"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		Client     *RETVAL;
		char       *name = (char *) SvPV_nolen(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetClientByName(name);
		ST(0)            = sv_newmortal();
		sv_setref_pv(ST(0), "Client", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetClientByAccID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetClientByAccID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetClientByAccID(THIS, uint32 account_id)"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		Client     *RETVAL;
		uint32     accid = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetClientByAccID(accid);
		ST(0)            = sv_newmortal();
		sv_setref_pv(ST(0), "Client", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetClientByID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetClientByID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetClientByID(THIS, uint16 client_id)"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		Client     *RETVAL;
		uint16     id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetClientByID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Client", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetClientByCharID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetClientByCharID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetClientByCharID(THIS, uint32 character_id)"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		Client     *RETVAL;
		uint32     iCharID = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetClientByCharID(iCharID);
		ST(0)              = sv_newmortal();
		sv_setref_pv(ST(0), "Client", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetClientByWID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetClientByWID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetClientByWID(THIS, uint32 wid)"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		Client     *RETVAL;
		uint32     iWID = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetClientByWID(iWID);
		ST(0)           = sv_newmortal();
		sv_setref_pv(ST(0), "Client", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetObjectByDBID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetObjectByDBID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetObjectByDBID(THIS, uint32 database_id)"); // @categories Script Utility, Objects
	{
		EntityList *THIS;
		Object     *RETVAL;
		uint32     id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetObjectByDBID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Object", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetObjectByID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetObjectByID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetObjectByID(THIS, uint32 entity_id)"); // @categories Script Utility, Objects
	{
		EntityList *THIS;
		Object     *RETVAL;
		uint32     id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetObjectByID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Object", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetDoorsByDBID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetDoorsByDBID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetDoorsByDBID(THIS, uint32 database_id)"); // @categories Script Utility, Doors
	{
		EntityList *THIS;
		Doors      *RETVAL;
		uint32     id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetDoorsByDBID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Doors", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetDoorsByDoorID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetDoorsByDoorID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetDoorsByDoorID(THIS, uint32 door_id)"); // @categories Script Utility, Doors
	{
		EntityList *THIS;
		Doors      *RETVAL;
		uint32     id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetDoorsByDoorID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Doors", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetDoorsByID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetDoorsByID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetDoorsByID(THIS, uint32 entity_id)"); // @categories Script Utility, Doors
	{
		EntityList *THIS;
		Doors      *RETVAL;
		uint32     id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetDoorsByID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Doors", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_FindDoor); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_FindDoor) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::FindDoor(THIS, uint32 door_id)"); // @categories Script Utility, Doors
	{
		EntityList *THIS;
		Doors      *RETVAL;
		uint32     id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->FindDoor(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Doors", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetGroupByMob); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetGroupByMob) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetGroupByMob(THIS, Mob* mob)"); // @categories Account and Character, Script Utility, Group
	{
		EntityList *THIS;
		Group      *RETVAL;
		Mob        *mob;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			mob = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "mob is not of type Mob");
		if (mob == nullptr)
			Perl_croak(aTHX_ "mob is nullptr, avoiding crash.");

		RETVAL = THIS->GetGroupByMob(mob);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "Group", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetGroupByClient); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetGroupByClient) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetGroupByClient(THIS, Client* client)"); // @categories Account and Character, Script Utility, Group
	{
		EntityList *THIS;
		Group      *RETVAL;
		Client     *client;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Client")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			client = INT2PTR(Client *, tmp);
		} else
			Perl_croak(aTHX_ "client is not of type Client");
		if (client == nullptr)
			Perl_croak(aTHX_ "client is nullptr, avoiding crash.");

		RETVAL = THIS->GetGroupByClient(client);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "Group", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetGroupByID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetGroupByID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetGroupByID(THIS, id)"); // @categories Account and Character, Script Utility, Group
	{
		EntityList *THIS;
		Group      *RETVAL;
		uint32     id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetGroupByID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Group", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetGroupByLeaderName); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetGroupByLeaderName) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetGroupByLeaderName(THIS, leader)"); // @categories Account and Character, Script Utility, Group
	{
		EntityList *THIS;
		Group      *RETVAL;
		char       *leader = (char *) SvPV_nolen(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetGroupByLeaderName(leader);
		ST(0)              = sv_newmortal();
		sv_setref_pv(ST(0), "Group", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetRaidByID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetRaidByID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetRaidByID(THIS, id)"); // @categories Script Utility, Raid
	{
		EntityList *THIS;
		Raid       *RETVAL;
		uint32     id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetRaidByID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Raid", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetRaidByClient); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetRaidByClient) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetRaidByClient(THIS, client)"); // @categories Account and Character, Script Utility, Raid
	{
		EntityList *THIS;
		Raid       *RETVAL;
		Client     *client;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Client")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			client = INT2PTR(Client *, tmp);
		} else
			Perl_croak(aTHX_ "client is not of type Client");
		if (client == nullptr)
			Perl_croak(aTHX_ "client is nullptr, avoiding crash.");

		RETVAL = THIS->GetRaidByClient(client);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "Raid", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetCorpseByOwner); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetCorpseByOwner) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetCorpseByOwner(THIS, client)"); // @categories Script Utility, Corpse
	{
		EntityList *THIS;
		Corpse     *RETVAL;
		Client     *client;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Client")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			client = INT2PTR(Client *, tmp);
		} else
			Perl_croak(aTHX_ "client is not of type Client");
		if (client == nullptr)
			Perl_croak(aTHX_ "client is nullptr, avoiding crash.");

		RETVAL = THIS->GetCorpseByOwner(client);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "Corpse", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetCorpseByID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetCorpseByID) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetCorpseByID(THIS, id)"); // @categories Script Utility, Corpse
	{
		EntityList *THIS;
		Corpse     *RETVAL;
		uint16     id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetCorpseByID(id);
		ST(0)         = sv_newmortal();
		sv_setref_pv(ST(0), "Corpse", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetCorpseByName); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetCorpseByName) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetCorpseByName(THIS, name)"); // @categories Script Utility, Corpse
	{
		EntityList *THIS;
		Corpse     *RETVAL;
		char       *name = (char *) SvPV_nolen(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetCorpseByName(name);
		ST(0)            = sv_newmortal();
		sv_setref_pv(ST(0), "Corpse", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_ClearClientPetitionQueue); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_ClearClientPetitionQueue) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::ClearClientPetitionQueue(THIS)"); // @categories Script Utility
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->ClearClientPetitionQueue();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_CanAddHateForMob); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_CanAddHateForMob) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::CanAddHateForMob(THIS, Mob* target)"); // @categories Script Utility, Hate and Aggro
	{
		EntityList *THIS;
		bool       RETVAL;
		Mob        *p;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			p = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "p is not of type Mob");
		if (p == nullptr)
			Perl_croak(aTHX_ "p is nullptr, avoiding crash.");

		RETVAL = THIS->CanAddHateForMob(p);
		ST(0) = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_Clear); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_Clear) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::Clear(THIS)"); // @categories Script Utility
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->Clear();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveMob); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveMob) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveMob(THIS, delete_id)"); // @categories Script Utility
	{
		EntityList *THIS;
		bool       RETVAL;
		uint16     delete_id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->RemoveMob(delete_id);
		ST(0)                = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveClient); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveClient) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveClient(THIS, delete_id)"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		bool       RETVAL;
		uint16     delete_id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->RemoveClient(delete_id);
		ST(0)                = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveNPC); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveNPC) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveNPC(THIS, delete_id)"); // @categories Script Utility
	{
		EntityList *THIS;
		bool       RETVAL;
		uint16     delete_id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->RemoveNPC(delete_id);
		ST(0)                = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveGroup); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveGroup) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveGroup(THIS, delete_id)"); // @categories Script Utility, Group
	{
		EntityList *THIS;
		bool       RETVAL;
		uint32     delete_id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->RemoveGroup(delete_id);
		ST(0)                = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveCorpse); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveCorpse) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveCorpse(THIS, delete_id)"); // @categories Corpse
	{
		EntityList *THIS;
		bool       RETVAL;
		uint16     delete_id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->RemoveCorpse(delete_id);
		ST(0)                = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveDoor); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveDoor) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveDoor(THIS, delete_id)"); // @categories Doors
	{
		EntityList *THIS;
		bool       RETVAL;
		uint16     delete_id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->RemoveDoor(delete_id);
		ST(0)                = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveTrap); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveTrap) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveTrap(THIS, delete_id)"); // @categories Script Utility
	{
		EntityList *THIS;
		bool       RETVAL;
		uint16     delete_id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->RemoveTrap(delete_id);
		ST(0)                = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveObject); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveObject) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveObject(THIS, delete_id)"); // @categories Script Utility, Objects
	{
		EntityList *THIS;
		bool       RETVAL;
		uint16     delete_id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->RemoveObject(delete_id);
		ST(0)                = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveAllMobs); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveAllMobs) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveAllMobs(THIS)"); // @categories Script Utility
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->RemoveAllMobs();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveAllClients); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveAllClients) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveAllClients(THIS)"); // @categories Script Utility
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->RemoveAllClients();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveAllNPCs); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveAllNPCs) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveAllNPCs(THIS)"); // @categories Script Utility
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->RemoveAllNPCs();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveAllGroups); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveAllGroups) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveAllGroups(THIS)"); // @categories Group
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->RemoveAllGroups();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveAllCorpses); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveAllCorpses) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveAllCorpses(THIS)"); // @categories Corpse
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->RemoveAllCorpses();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveAllDoors); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveAllDoors) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveAllDoors(THIS)"); // @categories Doors
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->RemoveAllDoors();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveAllTraps); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveAllTraps) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveAllTraps(THIS)"); // @categories Script Utility
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->RemoveAllTraps();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveAllObjects); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveAllObjects) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveAllObjects(THIS)"); // @categories Objects
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		THIS->RemoveAllObjects();
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_Message); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_Message) {
	dXSARGS;
	if (items < 4)
		Perl_croak(aTHX_ "Usage: EntityList::Message(THIS, uint32 guild_id, uint32 emote_color_type, string message)"); // @categories Script Utility
	{
		EntityList *THIS;
		uint32     to_guilddbid = (uint32) SvUV(ST(1));
		uint32     type         = (uint32) SvUV(ST(2));
		char       *message     = (char *) SvPV_nolen(ST(3));
		VALIDATE_THIS_IS_ENTITY;
		THIS->Message(to_guilddbid, type, message);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_MessageStatus); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_MessageStatus) {
	dXSARGS;
	if (items < 5)
		Perl_croak(aTHX_ "Usage: EntityList::MessageStatus(THIS, uint32 guild_id, uint32 emote_color_type, string message)"); // @categories Script Utility
	{
		EntityList *THIS;
		uint32     to_guilddbid = (uint32) SvUV(ST(1));
		int        to_minstatus = (int) SvIV(ST(2));
		uint32     type         = (uint32) SvUV(ST(3));
		char       *message     = (char *) SvPV_nolen(ST(4));
		VALIDATE_THIS_IS_ENTITY;
		THIS->MessageStatus(
			to_guilddbid,
			to_minstatus,
			type,
			message
		);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_MessageClose); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_MessageClose) {
	dXSARGS;
	if (items < 6)
		Perl_croak(aTHX_ "Usage: EntityList::MessageClose(THIS, Mob* sender, bool skip_sender, float distance, uint32 emote_color_type, string message)");
	{
		EntityList *THIS;
		Mob        *sender;
		bool       skipsender = (bool) SvTRUE(ST(2));
		float      dist       = (float) SvNV(ST(3));
		uint32     type       = (uint32) SvUV(ST(4));
		char       *message   = (char *) SvPV_nolen(ST(5));
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			sender = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "sender is not of type Mob");
		if (sender == nullptr)
			Perl_croak(aTHX_ "sender is nullptr, avoiding crash.");

		THIS->MessageClose(sender, skipsender, dist, type, message);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveFromTargets); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveFromTargets) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveFromTargets(THIS, Mob* target)"); // @categories Script Utility
	{
		EntityList *THIS;
		Mob        *mob;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			mob = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "mob is not of type Mob");
		if (mob == nullptr)
			Perl_croak(aTHX_ "mob is nullptr, avoiding crash.");

		THIS->RemoveFromTargets(mob);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_ReplaceWithTarget); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_ReplaceWithTarget) {
	dXSARGS;
	if (items != 3)
		Perl_croak(aTHX_ "Usage: EntityList::ReplaceWithTarget(THIS, Mob* old_mob, Mob* new_target)"); // @categories Script Utility
	{
		EntityList *THIS;
		Mob        *pOldMob;
		Mob        *pNewTarget;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			pOldMob = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "pOldMob is not of type Mob");
		if (pOldMob == nullptr)
			Perl_croak(aTHX_ "pOldMob is nullptr, avoiding crash.");

		if (sv_derived_from(ST(2), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(2)));
			pNewTarget = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "pNewTarget is not of type Mob");
		if (pNewTarget == nullptr)
			Perl_croak(aTHX_ "pNewTarget is nullptr, avoiding crash.");

		THIS->ReplaceWithTarget(pOldMob, pNewTarget);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_OpenDoorsNear); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_OpenDoorsNear) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::OpenDoorsNear(THIS, NPC* opener)"); // @categories Script Utility, Doors
	{
		EntityList *THIS;
		Mob        *opener;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			opener = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "opener is not of type Mob");
		if (opener == nullptr)
			Perl_croak(aTHX_ "opener is nullptr, avoiding crash.");

		THIS->OpenDoorsNear(opener);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_MakeNameUnique); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_MakeNameUnique) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::MakeNameUnique(THIS, string name)"); // @categories Script Utility
	{
		EntityList *THIS;
		char       *RETVAL;
		dXSTARG;
		char       *name = (char *) SvPV_nolen(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->MakeNameUnique(name);
		sv_setpv(TARG, RETVAL);
		XSprePUSH;
		PUSHTARG;
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveNumbers); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveNumbers) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityListDeprecated::RemoveNumbers(CLASS, name)");
	{
		char *RETVAL;
		dXSTARG;
		char *name = (char *) SvPV_nolen(ST(1));

		RETVAL = EntityList::RemoveNumbers(name);
		sv_setpv(TARG, RETVAL);
		XSprePUSH;
		PUSHTARG;
	}
	XSRETURN(1);
}

XS(XS_EntityList_SignalMobsByNPCID); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_SignalMobsByNPCID) {
	dXSARGS;
	if (items != 3)
		Perl_croak(aTHX_ "Usage: EntityList::SignalMobsByNPCID(THIS, uint32 npc_type_id, int signal_id)"); // @categories Script Utility
	{
		EntityList *THIS;
		uint32     npc_type  = (uint32) SvUV(ST(1));
		int        signal_id = (int) SvIV(ST(2));
		VALIDATE_THIS_IS_ENTITY;
		THIS->SignalMobsByNPCID(npc_type, signal_id);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_RemoveEntity); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveEntity) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveEntity(THIS, uint16 id)"); // @categories Script Utility
	{
		EntityList *THIS;
		uint16     id = (uint16) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		THIS->RemoveEntity(id);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_DeleteNPCCorpses); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_DeleteNPCCorpses) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::DeleteNPCCorpses(THIS)"); // @categories Corpse
	{
		EntityList *THIS;
		uint32      RETVAL;
		dXSTARG;
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->DeleteNPCCorpses();
		XSprePUSH;
		PUSHu((UV) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_DeletePlayerCorpses); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_DeletePlayerCorpses) {
	dXSARGS;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::DeletePlayerCorpses(THIS)"); // @categories Account and Character, Corpse
	{
		EntityList *THIS;
		uint32      RETVAL;
		dXSTARG;
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->DeletePlayerCorpses();
		XSprePUSH;
		PUSHu((UV) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_HalveAggro); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_HalveAggro) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::HalveAggro(THIS, Mob* target)"); // @categories Script Utility, Hate and Aggro
	{
		EntityList *THIS;
		Mob        *who;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			who = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "who is not of type Mob");
		if (who == nullptr)
			Perl_croak(aTHX_ "who is nullptr, avoiding crash.");

		THIS->HalveAggro(who);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_DoubleAggro); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_DoubleAggro) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::DoubleAggro(THIS, *Mob target)"); // @categories Script Utility
	{
		EntityList *THIS;
		Mob        *who;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			who = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "who is not of type Mob");
		if (who == nullptr)
			Perl_croak(aTHX_ "who is nullptr, avoiding crash.");

		THIS->DoubleAggro(who);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_ClearFeignAggro); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_ClearFeignAggro) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::ClearFeignAggro(THIS, Mob* target)"); // @categories Script Utility
	{
		EntityList *THIS;
		Mob        *targ;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			targ = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "targ is not of type Mob");
		if (targ == nullptr)
			Perl_croak(aTHX_ "targ is nullptr, avoiding crash.");

		THIS->ClearFeignAggro(targ);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_Fighting); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_Fighting) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::Fighting(THIS, Mob* target)"); // @categories Script Utility
	{
		EntityList *THIS;
		bool       RETVAL;
		Mob        *targ;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			targ = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "targ is not of type Mob");
		if (targ == nullptr)
			Perl_croak(aTHX_ "targ is nullptr, avoiding crash.");

		RETVAL = THIS->Fighting(targ);
		ST(0) = boolSV(RETVAL);
		sv_2mortal(ST(0));
	}
	XSRETURN(1);
}

XS(XS_EntityList_RemoveFromHateLists); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_RemoveFromHateLists) {
	dXSARGS;
	if (items < 2 || items > 3)
		Perl_croak(aTHX_ "Usage: EntityList::RemoveFromHateLists(THIS, Mob* mob, [bool set_to_one = false])"); // @categories Script Utility, Hate and Aggro
	{
		EntityList *THIS;
		Mob        *mob;
		bool       settoone;
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			mob = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "mob is not of type Mob");
		if (mob == nullptr)
			Perl_croak(aTHX_ "mob is nullptr, avoiding crash.");

		if (items < 3)
			settoone = false;
		else {
			settoone = (bool) SvTRUE(ST(2));
		}

		THIS->RemoveFromHateLists(mob, settoone);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_MessageGroup); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_MessageGroup) {
	dXSARGS;
	if (items < 5)
		Perl_croak(aTHX_ "Usage: EntityList::MessageGroup(THIS, Mob* sender, bool skip_close, uint32 emote_color_type, string message)"); // @categories Script Utility, Group
	{
		EntityList *THIS;
		Mob        *sender;
		bool       skipclose = (bool) SvTRUE(ST(2));
		uint32     type      = (uint32) SvUV(ST(3));
		char       *message  = (char *) SvPV_nolen(ST(4));
		VALIDATE_THIS_IS_ENTITY;
		if (sv_derived_from(ST(1), "Mob")) {
			IV tmp = SvIV((SV *) SvRV(ST(1)));
			sender = INT2PTR(Mob *, tmp);
		} else
			Perl_croak(aTHX_ "sender is not of type Mob");
		if (sender == nullptr)
			Perl_croak(aTHX_ "sender is nullptr, avoiding crash.");

		THIS->MessageGroup(sender, skipclose, type, message);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_GetRandomClient); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetRandomClient) {
	dXSARGS;
	if (items < 5 || items > 6)
		Perl_croak(aTHX_ "Usage: EntityList::GetRandomClient(THIS, float x, float y, float z, float distance, [Client* exclude_client = nullptr])"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		Client *RETVAL, *exclude_client = nullptr;
		float x = (float) SvNV(ST(1));
		float y = (float) SvNV(ST(2));
		float z = (float) SvNV(ST(3));
		float distance = (float) SvNV(ST(4));
		VALIDATE_THIS_IS_ENTITY;

		if (items == 6) {
			if (sv_derived_from(ST(5), "Client")) {
				IV tmp = SvIV((SV *) SvRV(ST(5)));
				exclude_client = INT2PTR(Client *, tmp);
			}
		}
		
		RETVAL = entity_list.GetRandomClient(glm::vec3(x, y, z), (distance * distance), exclude_client);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "Client", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetMobList); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetMobList) {
	dXSARGS;
	int num_mobs = 0;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::GetMobList(THIS)"); // @categories Script Utility
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		std::list<Mob *> mob_list;
		entity_list.GetMobList(mob_list);
		auto iter = mob_list.begin();

		while (iter != mob_list.end()) {
			Mob *entry = (*iter);
			ST(0) = sv_newmortal();
			sv_setref_pv(ST(0), "Mob", (void *) entry);
			XPUSHs(ST(0));
			num_mobs++;
			iter++;
		}
	}
	XSRETURN(num_mobs);
}

XS(XS_EntityList_GetClientList); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetClientList) {
	dXSARGS;
	int num_clients = 0;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::GetClientList(THIS)"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		std::list<Client *> client_list;
		entity_list.GetClientList(client_list);
		auto iter = client_list.begin();

		while (iter != client_list.end()) {
			Client *entry = (*iter);
			ST(0) = sv_newmortal();
			sv_setref_pv(ST(0), "Client", (void *) entry);
			XPUSHs(ST(0));
			num_clients++;
			iter++;
		}
	}
	XSRETURN(num_clients);
}

#ifdef BOTS
XS(XS_EntityList_GetBotByID);
XS(XS_EntityList_GetBotByID) {
	dXSARGS;
	int bot_count = 0;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetBotByID(THIS, uint32 bot_id)"); // @categories Script Utility, Bot
	{
		EntityList* THIS;
		Bot* RETVAL;
		uint32 bot_id = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetBotByBotID(bot_id);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "Bot", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetBotByName);
XS(XS_EntityList_GetBotByName) {
	dXSARGS;
	int bot_count = 0;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::GetBotByName(THIS, string bot_name)"); // @categories Script Utility, Bot
	{
		EntityList* THIS;
		Bot* RETVAL;
		std::string bot_name = (std::string) SvPV_nolen(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		RETVAL = THIS->GetBotByBotName(bot_name);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "Bot", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetBotList);
XS(XS_EntityList_GetBotList) {
	dXSARGS;
	int bot_count = 0;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::GetBotList(THIS)"); // @categories Script Utility, Bot
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		auto current_bot_list = THIS->GetBotList();
		for (auto bot_iterator : current_bot_list) {
			ST(0) = sv_newmortal();
			sv_setref_pv(ST(0), "Bot", (void *)bot_iterator);
			XPUSHs(ST(0));
			bot_count++;
		}
	}
	XSRETURN(bot_count);
}
#endif

XS(XS_EntityList_GetNPCList); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetNPCList) {
	dXSARGS;
	int num_npcs = 0;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::GetNPCList(THIS)"); // @categories Script Utility
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		std::list<NPC *> npc_list;
		entity_list.GetNPCList(npc_list);
		auto iter = npc_list.begin();

		while (iter != npc_list.end()) {
			NPC *entry = (*iter);
			ST(0) = sv_newmortal();
			sv_setref_pv(ST(0), "NPC", (void *) entry);
			XPUSHs(ST(0));
			num_npcs++;
			iter++;
		}
	}
	XSRETURN(num_npcs);
}

XS(XS_EntityList_GetCorpseList); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetCorpseList) {
	dXSARGS;
	int num_corpses = 0;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::GetCorpseList(THIS)"); // @categories Script Utility, Corpse
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		std::list<Corpse *> corpse_list;
		entity_list.GetCorpseList(corpse_list);
		auto iter = corpse_list.begin();

		while (iter != corpse_list.end()) {
			Corpse *entry = (*iter);
			ST(0) = sv_newmortal();
			sv_setref_pv(ST(0), "Corpse", (void *) entry);
			XPUSHs(ST(0));
			num_corpses++;
			iter++;
		}
	}
	XSRETURN(num_corpses);
}

XS(XS_EntityList_GetObjectList); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetObjectList) {
	dXSARGS;
	int num_objects = 0;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::GetObjectList(THIS)"); // @categories Script Utility, Objects
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		std::list<Object *> object_list;
		entity_list.GetObjectList(object_list);
		auto iter = object_list.begin();

		while (iter != object_list.end()) {
			Object *entry = (*iter);
			ST(0) = sv_newmortal();
			sv_setref_pv(ST(0), "Object", (void *) entry);
			XPUSHs(ST(0));
			num_objects++;
			iter++;
		}
	}
	XSRETURN(num_objects);
}

XS(XS_EntityList_GetDoorsList); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetDoorsList) {
	dXSARGS;
	int num_objects = 0;
	if (items != 1)
		Perl_croak(aTHX_ "Usage: EntityList::GetDoorsList(THIS)"); // @categories Script Utility, Doors
	{
		EntityList *THIS;
		VALIDATE_THIS_IS_ENTITY;
		std::list<Doors *> door_list;
		entity_list.GetDoorsList(door_list);
		auto iter = door_list.begin();

		while (iter != door_list.end()) {
			Doors *entry = (*iter);
			ST(0) = sv_newmortal();
			sv_setref_pv(ST(0), "Doors", (void *) entry);
			XPUSHs(ST(0));
			num_objects++;
			iter++;
		}
	}
	XSRETURN(num_objects);
}

XS(XS_EntityList_SignalAllClients); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_SignalAllClients) {
	dXSARGS;
	if (items != 2)
		Perl_croak(aTHX_ "Usage: EntityList::SignalAllClients(THIS, uint32 data)"); // @categories Script Utility
	{
		EntityList *THIS;
		uint32     data = (uint32) SvUV(ST(1));
		VALIDATE_THIS_IS_ENTITY;
		entity_list.SignalAllClients(data);
	}
	XSRETURN_EMPTY;
}

XS(XS_EntityList_GetRandomMob); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetRandomMob) {
	dXSARGS;
	if (items < 5 || items > 6)
		Perl_croak(aTHX_ "Usage: EntityList::GetRandomMob(THIS, float x, float y, float z, float distance, [Mob* exclude_mob = nullptr])"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		Mob *RETVAL, *exclude_mob = nullptr;
		float x = (float) SvNV(ST(1));
		float y = (float) SvNV(ST(2));
		float z = (float) SvNV(ST(3));
		float distance = (float) SvNV(ST(4));
		VALIDATE_THIS_IS_ENTITY;

		if (items == 6) {
			if (sv_derived_from(ST(5), "Mob")) {
				IV tmp = SvIV((SV *) SvRV(ST(5)));
				exclude_mob = INT2PTR(Mob*, tmp);
			}
		}

		RETVAL = entity_list.GetRandomMob(glm::vec3(x, y, z), (distance * distance), exclude_mob);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "Mob", (void *) RETVAL);
	}
	XSRETURN(1);
}

XS(XS_EntityList_GetRandomNPC); /* prototype to pass -Wmissing-prototypes */
XS(XS_EntityList_GetRandomNPC) {
	dXSARGS;
	if (items < 5 || items > 6)
		Perl_croak(aTHX_ "Usage: EntityList::GetRandomNPC(THIS, float x, float y, float z, float distance, [NPC* exclude_npc = nullptr])"); // @categories Account and Character, Script Utility
	{
		EntityList *THIS;
		NPC *RETVAL, *exclude_npc = nullptr;
		float x = (float) SvNV(ST(1));
		float y = (float) SvNV(ST(2));
		float z = (float) SvNV(ST(3));
		float distance = (float) SvNV(ST(4));
		VALIDATE_THIS_IS_ENTITY;

		if (items == 6) {
			if (sv_derived_from(ST(5), "NPC")) {
				IV tmp = SvIV((SV *) SvRV(ST(5)));
				exclude_npc = INT2PTR(NPC*, tmp);
			}
		}

		RETVAL = entity_list.GetRandomNPC(glm::vec3(x, y, z), (distance * distance), exclude_npc);
		ST(0) = sv_newmortal();
		sv_setref_pv(ST(0), "NPC", (void *) RETVAL);
	}
	XSRETURN(1);
}

#ifdef __cplusplus
extern "C"
#endif
XS(boot_EntityList); /* prototype to pass -Wmissing-prototypes */
XS(boot_EntityList) {
	dXSARGS;
	char file[256];
	strncpy(file, __FILE__, 256);
	file[255] = 0;

	if (items != 1)
		fprintf(stderr, "boot_quest does not take any arguments.");
	char buf[128];

	//add the strcpy stuff to get rid of const warnings....

	XS_VERSION_BOOTCHECK;
	newXSproto(strcpy(buf, "CanAddHateForMob"), XS_EntityList_CanAddHateForMob, file, "$$");
	newXSproto(strcpy(buf, "Clear"), XS_EntityList_Clear, file, "$");
	newXSproto(strcpy(buf, "ClearClientPetitionQueue"), XS_EntityList_ClearClientPetitionQueue, file, "$");
	newXSproto(strcpy(buf, "ClearFeignAggro"), XS_EntityList_ClearFeignAggro, file, "$$");
	newXSproto(strcpy(buf, "DeleteNPCCorpses"), XS_EntityList_DeleteNPCCorpses, file, "$");
	newXSproto(strcpy(buf, "DeletePlayerCorpses"), XS_EntityList_DeletePlayerCorpses, file, "$");
	newXSproto(strcpy(buf, "DoubleAggro"), XS_EntityList_DoubleAggro, file, "$$");
	newXSproto(strcpy(buf, "Fighting"), XS_EntityList_Fighting, file, "$$");
	newXSproto(strcpy(buf, "FindDoor"), XS_EntityList_FindDoor, file, "$$");
#ifdef BOTS
	newXSproto(strcpy(buf, "GetBotByID"), XS_EntityList_GetBotByID, file, "$$");
	newXSproto(strcpy(buf, "GetBotByName"), XS_EntityList_GetBotByName, file, "$$");
	newXSproto(strcpy(buf, "GetBotList"), XS_EntityList_GetBotList, file, "$");
#endif
	newXSproto(strcpy(buf, "GetClientByAccID"), XS_EntityList_GetClientByAccID, file, "$$");
	newXSproto(strcpy(buf, "GetClientByCharID"), XS_EntityList_GetClientByCharID, file, "$$");
	newXSproto(strcpy(buf, "GetClientByID"), XS_EntityList_GetClientByID, file, "$$");
	newXSproto(strcpy(buf, "GetClientByName"), XS_EntityList_GetClientByName, file, "$$");
	newXSproto(strcpy(buf, "GetClientByWID"), XS_EntityList_GetClientByWID, file, "$$");
	newXSproto(strcpy(buf, "GetClientList"), XS_EntityList_GetClientList, file, "$");
	newXSproto(strcpy(buf, "GetCorpseByID"), XS_EntityList_GetCorpseByID, file, "$$");
	newXSproto(strcpy(buf, "GetCorpseByName"), XS_EntityList_GetCorpseByName, file, "$$");
	newXSproto(strcpy(buf, "GetCorpseByOwner"), XS_EntityList_GetCorpseByOwner, file, "$$");
	newXSproto(strcpy(buf, "GetCorpseList"), XS_EntityList_GetCorpseList, file, "$");
	newXSproto(strcpy(buf, "GetDoorsByDBID"), XS_EntityList_GetDoorsByDBID, file, "$$");
	newXSproto(strcpy(buf, "GetDoorsByDoorID"), XS_EntityList_GetDoorsByDoorID, file, "$$");
	newXSproto(strcpy(buf, "GetDoorsByID"), XS_EntityList_GetDoorsByID, file, "$$");
	newXSproto(strcpy(buf, "GetDoorsList"), XS_EntityList_GetDoorsList, file, "$");
	newXSproto(strcpy(buf, "GetGroupByClient"), XS_EntityList_GetGroupByClient, file, "$$");
	newXSproto(strcpy(buf, "GetGroupByID"), XS_EntityList_GetGroupByID, file, "$$");
	newXSproto(strcpy(buf, "GetGroupByLeaderName"), XS_EntityList_GetGroupByLeaderName, file, "$$");
	newXSproto(strcpy(buf, "GetGroupByMob"), XS_EntityList_GetGroupByMob, file, "$$");
	newXSproto(strcpy(buf, "GetMob"), XS_EntityList_GetMob, file, "$$");
	newXSproto(strcpy(buf, "GetMobByID"), XS_EntityList_GetMobByID, file, "$$");
	newXSproto(strcpy(buf, "GetMobByNpcTypeID"), XS_EntityList_GetMobByNpcTypeID, file, "$$");
	newXSproto(strcpy(buf, "GetMobID"), XS_EntityList_GetMobID, file, "$$");
	newXSproto(strcpy(buf, "GetMobList"), XS_EntityList_GetMobList, file, "$");
	newXSproto(strcpy(buf, "GetNPCByID"), XS_EntityList_GetNPCByID, file, "$$");
	newXSproto(strcpy(buf, "GetNPCByNPCTypeID"), XS_EntityList_GetNPCByNPCTypeID, file, "$$");
	newXSproto(strcpy(buf, "GetNPCBySpawnID"), XS_EntityList_GetNPCBySpawnID, file, "$$");
	newXSproto(strcpy(buf, "GetNPCList"), XS_EntityList_GetNPCList, file, "$");
	newXSproto(strcpy(buf, "GetObjectByDBID"), XS_EntityList_GetObjectByDBID, file, "$");
	newXSproto(strcpy(buf, "GetObjectByID"), XS_EntityList_GetObjectByID, file, "$");
	newXSproto(strcpy(buf, "GetObjectList"), XS_EntityList_GetObjectList, file, "$");
	newXSproto(strcpy(buf, "GetRaidByClient"), XS_EntityList_GetRaidByClient, file, "$$");
	newXSproto(strcpy(buf, "GetRaidByID"), XS_EntityList_GetRaidByID, file, "$$");
	newXSproto(strcpy(buf, "GetRandomClient"), XS_EntityList_GetRandomClient, file, "$$$$$;$");
	newXSproto(strcpy(buf, "GetRandomMob"), XS_EntityList_GetRandomMob, file, "$$$$$;$");
	newXSproto(strcpy(buf, "GetRandomNPC"), XS_EntityList_GetRandomNPC, file, "$$$$$;$");
	newXSproto(strcpy(buf, "HalveAggro"), XS_EntityList_HalveAggro, file, "$$");
	newXSproto(strcpy(buf, "IsMobSpawnedByNpcTypeID"), XS_EntityList_IsMobSpawnedByNpcTypeID, file, "$$");
	newXSproto(strcpy(buf, "MakeNameUnique"), XS_EntityList_MakeNameUnique, file, "$$");
	newXSproto(strcpy(buf, "Message"), XS_EntityList_Message, file, "$$$$;@");
	newXSproto(strcpy(buf, "MessageClose"), XS_EntityList_MessageClose, file, "$$$$$$;@");
	newXSproto(strcpy(buf, "MessageGroup"), XS_EntityList_MessageGroup, file, "$$$$$;@");
	newXSproto(strcpy(buf, "MessageStatus"), XS_EntityList_MessageStatus, file, "$$$$$;@");
	newXSproto(strcpy(buf, "OpenDoorsNear"), XS_EntityList_OpenDoorsNear, file, "$$");
	newXSproto(strcpy(buf, "RemoveAllClients"), XS_EntityList_RemoveAllClients, file, "$");
	newXSproto(strcpy(buf, "RemoveAllCorpses"), XS_EntityList_RemoveAllCorpses, file, "$");
	newXSproto(strcpy(buf, "RemoveAllDoors"), XS_EntityList_RemoveAllDoors, file, "$");
	newXSproto(strcpy(buf, "RemoveAllGroups"), XS_EntityList_RemoveAllGroups, file, "$");
	newXSproto(strcpy(buf, "RemoveAllMobs"), XS_EntityList_RemoveAllMobs, file, "$");
	newXSproto(strcpy(buf, "RemoveAllNPCs"), XS_EntityList_RemoveAllNPCs, file, "$");
	newXSproto(strcpy(buf, "RemoveAllObjects"), XS_EntityList_RemoveAllObjects, file, "$");
	newXSproto(strcpy(buf, "RemoveAllTraps"), XS_EntityList_RemoveAllTraps, file, "$");
	newXSproto(strcpy(buf, "RemoveClient"), XS_EntityList_RemoveClient, file, "$$");
	newXSproto(strcpy(buf, "RemoveCorpse"), XS_EntityList_RemoveCorpse, file, "$$");
	newXSproto(strcpy(buf, "RemoveDoor"), XS_EntityList_RemoveDoor, file, "$$");
	newXSproto(strcpy(buf, "RemoveEntity"), XS_EntityList_RemoveEntity, file, "$$");
	newXSproto(strcpy(buf, "RemoveFromHateLists"), XS_EntityList_RemoveFromHateLists, file, "$$;$");
	newXSproto(strcpy(buf, "RemoveFromTargets"), XS_EntityList_RemoveFromTargets, file, "$$");
	newXSproto(strcpy(buf, "RemoveGroup"), XS_EntityList_RemoveGroup, file, "$$");
	newXSproto(strcpy(buf, "RemoveMob"), XS_EntityList_RemoveMob, file, "$$");
	newXSproto(strcpy(buf, "RemoveNPC"), XS_EntityList_RemoveNPC, file, "$$");
	newXSproto(strcpy(buf, "RemoveNumbers"), XS_EntityList_RemoveNumbers, file, "$$");
	newXSproto(strcpy(buf, "RemoveObject"), XS_EntityList_RemoveObject, file, "$$");
	newXSproto(strcpy(buf, "RemoveTrap"), XS_EntityList_RemoveTrap, file, "$$");
	newXSproto(strcpy(buf, "ReplaceWithTarget"), XS_EntityList_ReplaceWithTarget, file, "$$$");
	newXSproto(strcpy(buf, "SignalAllClients"), XS_EntityList_SignalAllClients, file, "$$");
	newXSproto(strcpy(buf, "SignalMobsByNPCID"), XS_EntityList_SignalMobsByNPCID, file, "$$$");
	XSRETURN_YES;
}

#endif //EMBPERL_XS_CLASSES
